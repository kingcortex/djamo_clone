import 'dart:math';

import 'package:djamo_clone/pages/recap/page_1/widgets/red_moon_animation.dart';
import 'package:flutter/material.dart';

class RotatationAnimationWidget extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  final double speed;
  const RotatationAnimationWidget(
      {super.key,
      required this.controller,
      required this.child,
      this.speed = 1});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.value * r * (2 * speed) * pi, // Rotation complète
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
