import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SmallEarthWidget extends StatelessWidget {
  const SmallEarthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.svgs.globe1.svg(width: 80);
  }
}
