import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hauth_mobile/utils/device_unsupported_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hauth_mobile/generated/l10n.dart';
import 'package:hauth_mobile/utils/fcm/fcm_bootstrap.dart';
import 'package:hauth_mobile/utils/device_info.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/providers/server_health_provider.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/providers/locale_provider.dart';
import 'package:hauth_mobile/theme.dart';
import 'package:hauth_mobile/screens/intro/intro_screen.dart';
import 'package:hauth_mobile/screens/home_screen.dart';
import 'package:hauth_mobile/screens/auth_screen.dart';
import 'package:hauth_mobile/screens/pairing_screen.dart';
import 'package:hauth_mobile/screens/about_screen.dart';
import 'package:hauth_mobile/screens/error_screen.dart';
import 'package:hauth_mobile/screens/license_screen.dart';
import 'package:hauth_mobile/screens/watch_debug_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load(fileName: ".env");
  await updateDeviceInfo();
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );

  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseMessaging(navigatorKey, container, prefs);
  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
  //runApp(ProviderScope(child: WatchDebugApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Manually trigger the challenge to load from SharedPreferences
      if (kDebugMode) {
        print("App resumed, checking for cached challenge...");
      }
      SharedPreferences.getInstance().then((prefs) {
        prefs.reload().then((value) {
          ref.invalidate(loginChallengeProvider);
        });
      });
    }
  }

  Future<Widget> _getHome(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final firstRun = prefs.getBool("isFirstRun") ?? true;
    final paired = prefs.getBool("isPaired") ?? false;
    final api = ref.read(apiClientProvider);

    try {
      await api.run((client) => client.getHealthApi().getHealth());

      final brand = prefs.getString('brand');
      final manufacturer = prefs.getString('manufacturer');

      if(brand != "samsung") {
        throw DeviceUnsupportedException(S.current.unsupported_device(brand ?? ''));
      } else if(manufacturer != "samsung"){
        throw Exception(S.current.unsupported_device(manufacturer ?? ''));
      }

      if (firstRun) {
        return const IntroScreen();
      } else if (!paired) {
        return PairingScreen();
      } else {
        return const AuthScreen();
      }

    } on Exception catch (e) {
      return ErrorScreen(errorText: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final serverHealth = ref.watch(serverHealthProvider);
    final localeNotifier = ref.watch(localeProvider);

    return MaterialApp(
      title: 'HeartAuth Mobile',
      navigatorKey: navigatorKey,
      locale: localeNotifier.locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
      routes: {
        '/home': (context) => const AuthScreen(),
        '/pairing': (context) => PairingScreen(),
        '/about': (context) => const AboutScreen(),
        '/license': (context) => const LicenseScreen(),
        '/error': (context) => const ErrorScreen(),
      },
      home: serverHealth == ServerHealthStatus.unhealthy
          ? ErrorScreen(errorText: S.of(context).server_unreachable_error)
          : FutureBuilder<Widget>(
              future: _getHome(ref),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data!;
                } else {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
    );
  }
}
