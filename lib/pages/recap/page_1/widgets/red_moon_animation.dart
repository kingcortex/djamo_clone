import 'dart:math';

import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

const r = 360;

class RedMoonAnimation extends StatelessWidget {
  final AnimationController controller;
  const RedMoonAnimation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.value * r * 2 * pi, // Rotation complète
            child: child,
          );
        },
        child: Assets.svgs.redMoon.svg(width: 55),
      ),
    );
  }
}
