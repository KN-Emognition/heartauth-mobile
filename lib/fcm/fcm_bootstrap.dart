import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'firebase_options.dart';

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
    alert: true, badge: true, sound: true,
  );

  final t = await fm.getToken();
  if (t != null) onToken?.call(t);

  FirebaseMessaging.onMessage.listen((m) => onForeground?.call(m));
  FirebaseMessaging.onMessageOpenedApp.listen((m) => onOpened?.call(m));
  final initial = await fm.getInitialMessage();
  if (initial != null) onInitial?.call(initial);
}
