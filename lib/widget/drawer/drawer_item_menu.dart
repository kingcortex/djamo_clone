import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class DrawerMenuItem extends StatelessWidget {
  final SvgGenImage icon;
  final String label;
  final VoidCallback? onTap;
  const DrawerMenuItem(
      {super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon.svg(width: 40),
          19.horizontalSpace,
          Text(
            label,
            style: context.bodyLarge.copyWith(),
          )
        ],
      ),
    );
  }
}
