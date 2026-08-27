import 'package:flutter/material.dart';

class FadeSlideWrapper extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Offset beginOffset;
  final Curve curve;

  const FadeSlideWrapper({
    super.key,
    required this.child,
    required this.animation,
    this.beginOffset = const Offset(0, 0.2),
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final progress = curve.transform(animation.value);
        return Opacity(
          opacity: progress.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(
              beginOffset.dx * (1 - progress),
              beginOffset.dy * (1 - progress),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
