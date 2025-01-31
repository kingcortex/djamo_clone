import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/models/alert.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';

import '../Iconsax/flutter/iconsax_icons.dart';

class AlertTile extends StatelessWidget {
  final Alert alert;
  const AlertTile({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: alert.isRecap ? AppColors.containerColor2 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: alert.isRecap ? Border.all(color: AppColors.primary) : null,
        boxShadow: [containerBoxShadow],
      ),
      child: Row(
        children: [
          alert.icon,
          10.horizontalSpace,
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '${alert.title}\n',
                style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w500,
                    color: alert.isRecap ? AppColors.primary : null),
                children: [
                  TextSpan(
                    text: alert.messge,
                    style: context.bodySmall
                        .copyWith(color: AppColors.textGrayColor1),
                  )
                ],
              ),
            ),
          ),
          if (alert.isRecap)
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.arrow_right_3,
                size: 14,
                color: AppColors.primary,
              ),
            )
        ],
      ),
    );
  }
}
