import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    super.key,
    required this.actionIcon,
    required this.actionTitles,
    this.showBadge = false,
  });

  final SvgGenImage actionIcon;
  final String actionTitles;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 4, right: 4),
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.containerColor2,
                  shape: BoxShape.circle,
                ),
                child: actionIcon.svg(),
              ),
              if (showBadge)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.secondary,
                      size: 18,
                    ),
                  ),
                )
            ],
          ),
          8.verticaleSpace,
          Text(
            actionTitles,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
