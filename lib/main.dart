import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hauth_mobile/screens/watch_debug_screen.dart';
import 'package:hauth_mobile/watch/trigger_and_wait.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hauth_mobile/fcm/fcm_bootstrap.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/providers/server_health_provider.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/theme.dart';
import 'package:hauth_mobile/utils/device_info.dart';
import 'package:hauth_mobile/screens/intro/intro_screen.dart';
import 'package:hauth_mobile/screens/home_screen.dart';
import 'package:hauth_mobile/screens/auth_screen.dart';
import 'package:hauth_mobile/screens/pairing_screen.dart';
import 'package:hauth_mobile/screens/about_screen.dart';
import 'package:hauth_mobile/screens/error_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load(fileName: ".env");
  await updateDeviceInfo();
  await initWearLayer();
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );

  void handleMessage(RemoteMessage message, String context) {
    if (kDebugMode) {
      print('$context: ${message.notification?.title} ${message.data}');
    }

    final challengeId = message.data['challengeId'];
    final expiresAt = int.parse(message.data['exp']);
    final ttl = int.parse(message.data['ttl']);

    // check if the challenge has not already expired
    final expiry = DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);

    if (!DateTime.now().isBefore(expiry)) {
      return;
    }

    final challenge = LoginChallenge(
      challengeId: challengeId,
      expiresAt: expiresAt,
      ttl: ttl,
    );

    container.read(loginChallengeProvider.notifier).setChallenge(challenge);

    navigatorKey.currentState?.pushNamed('/auth');
  }

  WidgetsFlutterBinding.ensureInitialized();
  await fcmInit(
    onToken: (t) async {
      if (kDebugMode) {
        print('TOKEN: $t');
      }
      prefs.setString('fcmToken', t);
    },
    onForeground: (m) => handleMessage(m, 'FOREGROUND'),
    onOpened: (m) => handleMessage(m, 'OPENED'),
    onInitial: (m) => handleMessage(m, 'INITIAL'),
  );
  // runApp(UncontrolledProviderScope(container: container, child: MyApp()));
  runApp(const WatchDebugApp());
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
      final info = await api.run((client) => client.getHealthApi().getHealth());
      if (info.statusCode == 200) {
        if (firstRun) {
          return const IntroScreen();
        } else if (!paired) {
          return const PairingScreen();
        } else {
          return const HomeScreen();
        }
      } else {
        return const PairingScreen();
      }
    } on Exception catch (e) {
      return ErrorScreen(errorText: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final serverHealth = ref.watch(serverHealthProvider);

    return MaterialApp(
      title: 'HeartAuth Mobile',
      navigatorKey: navigatorKey,
      theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/pairing': (context) => const PairingScreen(),
        '/about': (context) => const AboutScreen(),
        '/error': (context) => const ErrorScreen(),
      },
      home: serverHealth == ServerHealthStatus.unhealthy
          ? const ErrorScreen(
              errorText:
                  "There was an error while trying to reach our servers. Please try again later.",
            )
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
