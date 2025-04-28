import 'dart:math';
import 'package:flutter/material.dart';

import 'red_moon_animation.dart';
import 'small_earth_widget.dart';
import 'small_yellow_moon_widget.dart';

class EarthWithMoonAnimation extends StatelessWidget {
  final AnimationController controller;
  const EarthWithMoonAnimation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center, // Centre les éléments
        children: [
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: -controller.value * r * 2 * pi, // Rotation complète
                  child: child,
                );
              },
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    //color: AppColors.danger,
                    ),
                child: SmallYellowMoonWidget(),
              ),
            ),
          ),

          // Terre qui tourne sur elle-même
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value * r * 2 * pi, // Rotation complète
                  child: child,
                );
              },
              child: SmallEarthWidget(),
            ),
          ),

          // Lune qui orbite autour de la Terre
        ],
      ),
    );
  }
}
