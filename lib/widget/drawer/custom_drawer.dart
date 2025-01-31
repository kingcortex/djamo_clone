import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/utils/constant.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../theme/colors/app_colors.dart';
import 'drawer_item_menu.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * .8,
      backgroundColor: AppColors.mainBg,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          _builderHeader(context),
          _buildMenu(),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: AppColors.secondary,
              boxShadow: [containerBoxShadow],
            ),
            child: Column(
              spacing: 12,
              children: [
                Text(
                  "Gagnez 1.000 FCFA par invité 🎉",
                  style:
                      context.titleSmall.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Vous recevrez 1.000 FCFA la première fois que votre invité effectue un paiement avec",
                  style: context.bodySmall.copyWith(
                    color: AppColors.textGrayColor1,
                  ),
                ),
                Text("Code de parrainage : ZGR88"),
                CustomButton(label: "Inviter un ami"),
                20.verticaleSpace,
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildMenu() {
    return Padding(
      padding: EdgeInsets.only(left: appPadding, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(6, (index) {
          return DrawerMenuItem(
            icon: [
              Assets.svgs.ibanDrawer,
              Assets.svgs.pointDrawer,
              Assets.svgs.notif,
              Assets.svgs.bonus,
              Assets.svgs.assist,
              Assets.svgs.lock,
            ][index],
            label: [
              "Mon Numero de compte",
              "Ponts à proximité",
              "Boîte de réception",
              "Compte bonus",
              "Aide",
              "Verrouiller"
            ][index],
          );
        }),
      ),
    );
  }

  Widget _builderHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 6),
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: Assets.pngs.avatar.image().image),
                  color: AppColors.secondary,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: AppColors.secondary,
                  ),
                ),
              )
            ],
          ),
          10.horizontalSpace,
          Column(
            spacing: 7,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DIOMANDÉ\nSOULEYMANE",
                style: context.bodyLarge.copyWith(
                    fontSize: 17,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "+225 01 02 03 93 92",
                style: context.bodyMedium.copyWith(
                  color: AppColors.textGrayColor1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                    decoration: ShapeDecoration(
                      color: Color(0xff2f2f33),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      "Carte Virtuelle",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    radius: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mon profil",
                        style: context.bodyMedium
                            .copyWith(color: AppColors.secondary),
                      ),
                      Icon(
                        Iconsax.arrow_right_3,
                        color: AppColors.secondary,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
