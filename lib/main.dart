import 'package:flutter/material.dart';
import 'package:hauth_mobile/providers/client_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hauth_mobile/theme.dart';
import 'package:hauth_mobile/screens/intro/intro_screen.dart';
import 'package:hauth_mobile/screens/home_screen.dart';
import 'package:hauth_mobile/screens/auth_screen.dart';
import 'package:hauth_mobile/screens/pairing_screen.dart';
import 'package:hauth_mobile/screens/about_screen.dart';
import 'package:hauth_mobile/screens/error_screen.dart';
import 'package:hauth_mobile/fcm/fcn_bootstrap.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  fcmInit(
    onToken: (t) => print('FCM token: $t'),
    onForeground: (m) => print('FG: ${m.notification?.title} ${m.data}'),
    onOpened: (m) => print('OPENED: ${m.data}'),
    onInitial: (m) => print('INITIAL: ${m.data}'),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Future<Widget> _getHome(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final firstRun = prefs.getBool("isFirstRun") ?? true;
    final paired = prefs.getBool("isPaired") ?? false;
    final healthapi = ref.read(healthApiProvider);

    try {
      final info = await healthapi.getHealth();
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
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
        '/pairing': (context) => const PairingScreen(),
        '/about': (context) => const AboutScreen(),
      },
      home: FutureBuilder<Widget>(
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
