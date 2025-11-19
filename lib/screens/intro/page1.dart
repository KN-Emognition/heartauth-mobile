import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hauth_mobile/generated/l10n.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';

/// Helper that builds the dev-only body widget containing a DropdownButton
/// whose items are the dotenv values for keys beginning with "API_URL".

Widget buildApiUrlDropdownBody(BuildContext context, WidgetRef ref) {
  // collect dotenv entries where the key starts with "API_URL"
  final entries = dotenv.env.entries
      .where((e) => e.key.startsWith('API_URL'))
      .toList();

  final prefs = ref.watch(sharedPreferencesProvider);

  final items = entries.map((e) {
    return DropdownMenuItem<String>(
      value: e.value,
      // constrain and truncate long text to prevent overflow
      child: SizedBox(
        width: double.infinity,
        child: Text(
          '${e.key}: ${e.value}',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }).toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        S.of(context).intropage1_body,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 20),
      // ensure the dropdown uses available width to avoid right-side overflow
      SizedBox(
        width: double.infinity,
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('Select API URL'),
          items: items,
          onChanged: (String? value) async {
            if (value == null) return;
            if (kDebugMode) {
              print('Selected API URL value: $value');
            }
            await prefs.setString('API_URL', value);
            ref.invalidate(apiUrlProvider);
          },
        ),
      ),
    ],
  );
}

class Page1 extends PageViewModel {
  // ignore: unused_field
  final WidgetRef _ref;

  // ignore: unused_field
  final BuildContext _context;

  Page1(this._context, this._ref)
    : super(
        title: S.of(_context).intropage1_title,
        body: (dotenv.env['DEV_MODE'] ?? 'false').toLowerCase() == 'true'
            ? null
            : S.of(_context).intropage1_body,
        bodyWidget: (dotenv.env['DEV_MODE'] ?? 'false').toLowerCase() == 'true'
            ? buildApiUrlDropdownBody(_context, _ref)
            : null,
        image: Center(
          child: SvgPicture.asset(
            'assets/hauth_logo.svg',
            width: 250,
            height: 250,
            semanticsLabel: S.of(_context).intropage1_semantics,
          ),
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
          pageColor: Theme.of(_context).colorScheme.onPrimary,
        ),
      );
}
