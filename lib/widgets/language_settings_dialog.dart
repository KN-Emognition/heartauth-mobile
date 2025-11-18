import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/locale_provider.dart';
import 'package:hauth_mobile/generated/l10n.dart';
import 'dart:ui' as ui;

class LanguageSettingsDialog extends HookConsumerWidget {
  const LanguageSettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeNotifier = ref.watch(localeProvider);

    // Supported locales in your app
    final supportedLocales = S.delegate.supportedLocales;

    // Device system locale (e.g., en_US → languageCode = "en")
    final systemLocale = ui.PlatformDispatcher.instance.locale;

    // Check if the system locale is supported
    final matchesSupported = supportedLocales.any(
      (loc) => loc.languageCode == systemLocale.languageCode,
    );

    // If supported, get that locale
    final matchingLocale = matchesSupported
        ? supportedLocales.firstWhere(
            (loc) => loc.languageCode == systemLocale.languageCode,
          )
        : null;

    return AlertDialog(
      title: Text(S.of(context).languagedialog_title),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...supportedLocales.map((locale) {
              final isSelected =
                  localeNotifier.locale?.languageCode == locale.languageCode;

              final isSystemDefaultLocale =
                  matchesSupported &&
                  matchingLocale!.languageCode == locale.languageCode;

              return ListTile(
                title: Row(
                  children: [
                    Text(locale.languageCode.toUpperCase()),
                    if (isSystemDefaultLocale)
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          S.of(context).languagedialog_default,
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                  ],
                ),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () {
                  ref.read(localeProvider).setLocale(locale);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
