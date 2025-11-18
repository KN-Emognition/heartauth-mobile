import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class Page1 extends PageViewModel {
  // ignore: unused_field
  final WidgetRef _ref;
  // ignore: unused_field
  final BuildContext _context;

  Page1(this._context, this._ref)
    : super(
        title: S.of(_context).intropage1_title,
        body: S.of(_context).intropage1_body,
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
