import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/bottomsheet/oder_card_bottomsheet.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';

class AccountNumberPage extends StatefulWidget {
  const AccountNumberPage({super.key});

  @override
  State<AccountNumberPage> createState() => _AccountNumberPageState();
}

class _AccountNumberPageState extends State<AccountNumberPage> {
  @override
  void initState() {
    Future.delayed(Durations.long4, () {
      showOrderCardBottomSheet(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.verticaleSpace,
          Text(
            "Obtenez votre Numéro de compte en 5 minutes",
            style: context.titleLarge,
          ),
          30.verticaleSpace,
          _buildInstruction(
            context,
            message: "Instantané. Aucun document requis",
            icon: Assets.svgs.flash,
            color: Color(0xfffef7dd),
          ),
          10.verticaleSpace,
          _buildInstruction(context,
              message:
                  "Votre propre Numéro de compte pour recevoir des virements bancaires UEMOA",
              icon: Assets.svgs.depotBank,
              color: Color(0xffe7fbf2)),
          15.verticaleSpace,
          _buildInstruction(context,
              message:
                  "Les dépôts sur votre compte Djamo via votre Numéro de compte sont sans frais",
              icon: Assets.svgs.f0,
              color: Color(0xffffedf2)),
          Spacer(),
          CustomButton(
            label: 'Obtenir mon N° de compte',
          ),
          30.verticaleSpace,
        ],
      ),
    );
  }

  Row _buildInstruction(BuildContext context,
      {required SvgGenImage icon,
      required String message,
      required Color color}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: icon.svg(),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            message,
            style: context.bodyMedium
                .copyWith(fontSize: 15, color: AppColors.basic700),
          ),
        )
      ],
    );
  }
}
