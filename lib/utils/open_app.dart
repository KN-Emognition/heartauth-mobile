import 'package:device_apps/device_apps.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openAppOrPlayStore(String packageName, {void Function(Exception)? onError}) async {
  bool isInstalled = await DeviceApps.isAppInstalled(packageName);

  if (isInstalled) {
    // Launch the installed app
    DeviceApps.openApp(packageName);
  } else {
    // Open Google Play Store (or browser if not available)
    final playStoreUri = Uri.parse("market://details?id=$packageName");
    final webUri = Uri.parse("https://play.google.com/store/apps/details?id=$packageName");

    try {
      if (!await launchUrl(playStoreUri, mode: LaunchMode.externalApplication)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } on Exception catch (e) {
      onError?.call(e);
    }
  }
}