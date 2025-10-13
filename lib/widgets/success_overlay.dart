import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';

class SuccessAnimationOverlay extends HookWidget {
  final void Function()? onCompleted;

  const SuccessAnimationOverlay({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();

    useEffect(() {
      void listener(AnimationStatus status) {
        if (status == AnimationStatus.completed && context.mounted) {
          onCompleted?.call();
        }
      }

      controller.addStatusListener(listener);
      return () => controller.removeStatusListener(listener);
    }, [controller]);

    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: LottieAnimation(
            'assets/animations/success.json',
            onCompleted: onCompleted,
          ),
        ),
      ),
    );
  }
}
