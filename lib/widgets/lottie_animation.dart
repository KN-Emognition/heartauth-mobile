import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends HookWidget {
  final void Function()? onCompleted;
  final String animationPath;
  final double width;
  final double height;
  final bool loop;
  final Duration loopDelay;

  const LottieAnimation(
    this.animationPath, {
    super.key,
    this.onCompleted,
    this.width = 120,
    this.height = 120,
    this.loop = false,
    this.loopDelay = const Duration(seconds: 0),
  });

  @override
  Widget build(BuildContext context) {
    if (loop && onCompleted != null) {
      throw Exception('Cannot set onCompleted callback when loop is true');
    }

    final controller = useAnimationController();

    useEffect(() {
      void listener(AnimationStatus status) {
        if (status == AnimationStatus.completed && context.mounted) {
          if(loop){
            Future.delayed(Duration(milliseconds: loopDelay.inMilliseconds),(){
              if(context.mounted){
                controller.forward(from: 0.0);
              }
            });
          }
          onCompleted?.call();
        }
      }

      controller.addStatusListener(listener);
      return () => controller.removeStatusListener(listener);
    }, [controller]);

    return Lottie.asset(
      animationPath,
      controller: controller,
      onLoaded: (composition) {
        controller.duration = composition.duration;
        controller.forward();
      },
      width: width,
      height: height,
    );
  }
}
