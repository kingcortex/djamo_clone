import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class YelowPlanetWithRing extends StatelessWidget {
  const YelowPlanetWithRing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 125,
      width: 160,
      child: Assets.svgs.yellowPlanetWithRing.svg(),
    );
  }
}
