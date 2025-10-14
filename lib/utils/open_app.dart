import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openAppOrPlayStore(String packageName, {void Function(Exception)? onError}) async {
  bool isInstalled = await LaunchApp.isAppInstalled(androidPackageName: packageName);

  if (isInstalled) {
    // Launch the installed app
    LaunchApp.openApp(androidPackageName: packageName);
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