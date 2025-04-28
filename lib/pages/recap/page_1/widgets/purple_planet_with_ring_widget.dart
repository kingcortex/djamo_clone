import 'dart:math';
import 'package:djamo_clone/pages/recap/page_1/widgets/purple_planet_with_ring_animation.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class PurplePlanetWithRingWidget extends StatelessWidget {
  const PurplePlanetWithRingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 35,
      width: 100,
      child: Assets.svgs.purplePlanetWithRing.svg(),
    );
  }
}
