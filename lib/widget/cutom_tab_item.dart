import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CutomTabItem extends StatelessWidget {
  final VoidCallback onTap;
  final String labels;
  final bool selected;
  const CutomTabItem({
    super.key,
    required this.labels,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 45,
        decoration: BoxDecoration(
          border: selected
              ? Border(bottom: BorderSide(width: 1.5, color: AppColors.primary))
              : null,
          borderRadius: BorderRadius.circular(8),
          color: selected ? AppColors.primary200 : AppColors.containerColor1,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(labels),
      ),
    );
  }
}
