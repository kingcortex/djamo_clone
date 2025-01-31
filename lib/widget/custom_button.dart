import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? fillColor;
  final double? height;
  const CustomButton(
      {super.key,
      required this.label,
      this.height,
      this.labelColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        label,
        style: context.bodyLarge.copyWith(
          color: labelColor ?? Colors.white,
        ),
      ),
    );
  }
}
