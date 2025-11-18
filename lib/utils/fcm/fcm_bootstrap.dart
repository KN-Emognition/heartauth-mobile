import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/utils/fcm/firebase_options.dart';

typedef FcmMsg = void Function(RemoteMessage m);
typedef FcmToken = void Function(String t);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage m) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('challengeId', m.data['challengeId']);
  await prefs.setInt('expiresAt', int.parse(m.data['exp']));
  await prefs.setInt('ttl', int.parse(m.data['ttl']));
}

Future<void> fcmInit({
  FcmToken? onToken,
  FcmMsg? onForeground,
  FcmMsg? onOpened,
  FcmMsg? onInitial,
}) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final fm = FirebaseMessaging.instance;

  await fm.requestPermission(alert: true, badge: true, sound: true);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  final t = await fm.getToken();
  if (t != null) onToken?.call(t);

  FirebaseMessaging.onMessage.listen((m) => onForeground?.call(m));
  FirebaseMessaging.onMessageOpenedApp.listen((m) => onOpened?.call(m));
  final initial = await fm.getInitialMessage();
  if (initial != null) onInitial?.call(initial);
}

void handleMessage(RemoteMessage message, String context, GlobalKey<NavigatorState> navigatorKey, ProviderContainer container) {
  if (kDebugMode) {
    print('$context: ${message.notification?.title} ${message.data}');
  }

  final challengeId = message.data['challengeId'];
  final expiresAt = int.parse(message.data['exp']);
  final ttl = int.parse(message.data['ttl']);
  final ephemeralPublicKeyPem = message.data['publicKey'];
  final nonce = message.data['nonce'];

  // check if the challenge has not already expired
  final expiry = DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);

  if (!DateTime.now().isBefore(expiry)) {
    return;
  }

  final challenge = LoginChallenge(
    challengeId: challengeId,
    expiresAt: expiresAt,
    ttl: ttl,
    nonce: nonce,
    ephemeralPublicKeyPem: ephemeralPublicKeyPem,
  );

  container.read(loginChallengeProvider.notifier).setChallenge(challenge);

  navigatorKey.currentState?.pushNamed('/auth');
}

Future<void> initializeFirebaseMessaging(GlobalKey<NavigatorState> navigatorKey, ProviderContainer container, SharedPreferences prefs) async {
  await fcmInit(
    onToken: (t) async {
      if (kDebugMode) {
        print('TOKEN: $t');
      }
      prefs.setString('fcmToken', t);
    },
    onForeground: (m) => handleMessage(m, 'FOREGROUND', navigatorKey, container),
    onOpened: (m) => handleMessage(m, 'OPENED', navigatorKey, container),
    onInitial: (m) => handleMessage(m, 'INITIAL', navigatorKey, container),
  );
}
