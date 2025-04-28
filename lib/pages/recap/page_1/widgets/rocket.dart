import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Rocket extends StatefulWidget {
  final AnimationController controller;
  const Rocket({super.key, required this.controller});

  @override
  State<Rocket> createState() => _RocketState();
}

class _RocketState extends State<Rocket> {
  late final Animation<Offset> slideTransitionAnimation;
  @override
  void initState() {
    slideTransitionAnimation =
        Tween<Offset>(begin: Offset(0, -.1), end: Offset(-.1, 0)).animate(
            CurvedAnimation(
                parent: widget.controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideTransitionAnimation,
      child: Assets.svgs.rocket.svg(width: 90),
    );
  }
}
