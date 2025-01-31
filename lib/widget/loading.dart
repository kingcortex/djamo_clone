import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Assets.lotties.loading.lottie(
      width: 30,
      height: 30,
      fit: BoxFit.fill,
    );
  }
}
