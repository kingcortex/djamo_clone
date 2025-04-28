import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SmallYellowMoonWidget extends StatelessWidget {
  const SmallYellowMoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Assets.svgs.smallYellowNoon.svg(),
    );
  }
}
