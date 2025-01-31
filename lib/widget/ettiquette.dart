import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

Container paiementEtiquette(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
    decoration: ShapeDecoration(
      color: AppColors.containerColor3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    child: Text(
      "Paiment",
      style: context.bodySmall.copyWith(
        color: AppColors.textPinkColors1,
      ),
    ),
  );
}

Widget depotEtiquette(BuildContext context, {EdgeInsets? padding}) {
  return Container(
    padding: padding ?? EdgeInsets.symmetric(vertical: 5, horizontal: 6),
    decoration: ShapeDecoration(
      color: AppColors.successbg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    child: Text(
      "Depot",
      style: context.bodySmall.copyWith(
        color: AppColors.success,
      ),
    ),
  );
}

Widget echecEtiquette(BuildContext context) {
  return Row(
    children: [
      Icon(
        Icons.block,
        size: 17,
        color: AppColors.danger,
      ),
      Text(
        "Echec",
        style: context.bodySmall.copyWith(
          color: AppColors.danger,
        ),
      ),
    ],
  );
}
