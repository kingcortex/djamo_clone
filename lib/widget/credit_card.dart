import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors/app_colors.dart';

class CreditCardDjamo extends StatelessWidget {
  const CreditCardDjamo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Assets.pngs.djamoCard.image();
  }
}
