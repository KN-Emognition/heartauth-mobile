import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class FutureProviderViewBuilder<T> extends HookConsumerWidget {
  final FutureProvider<T> provider;
  final Widget Function(BuildContext, WidgetRef, T) viewBuilder;
  final Color bgColor;

  const FutureProviderViewBuilder({
    super.key,
    required this.provider,
    required this.viewBuilder,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncValue = ref.watch(provider);
        return asyncValue.when(
          data: (data) => viewBuilder(context, ref, data),
          error: (error, stacktrace) {
            //navigate to error screen

            final navigator = Navigator.of(context);
            while (navigator.canPop()) {
              navigator.pop();
            }
            navigator.pushNamed(
              '/error',
              arguments: {'errorText': stacktrace.toString()},
            );

            return SizedBox(
              width: 400,
              height: 400,
              child: Scaffold(
                backgroundColor: bgColor,
                body: Center(
                  child: Text(S.of(context).watchdebugscreen_error(error)),
                ),
              ),
            );
          },
          loading: () => SizedBox(
            width: 400,
            height: 400,
            child: Scaffold(
              backgroundColor: bgColor,
              body: Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
}
