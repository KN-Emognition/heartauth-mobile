import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

typedef FcmMsg = void Function(RemoteMessage m);
typedef FcmToken = void Function(String t);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage m) async {}

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
