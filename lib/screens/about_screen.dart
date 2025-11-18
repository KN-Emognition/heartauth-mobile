import 'package:flutter/material.dart';
import 'package:hauth_mobile/widgets/app_card.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).aboutscreen_title)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppCard(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: theme.surface.withValues(alpha: 0.5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.of(context).aboutscreen_subtitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).aboutscreen_desc1,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).aboutscreen_desc2,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            S.of(context).aboutscreen_desc3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/license");
                },
                child: Text(S.of(context).aboutscreen_licenses_button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
