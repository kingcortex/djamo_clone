import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SoldeWidget extends StatefulWidget {
  const SoldeWidget({
    super.key,
  });

  @override
  State<SoldeWidget> createState() => _SoldeWidgetState();
}

class _SoldeWidgetState extends State<SoldeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool showSolde = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 190),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    if (showSolde) {
      _controller.forward();
    }
  }

  void toggleSolde() {
    setState(() {
      showSolde = !showSolde;
      if (showSolde) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [containerBoxShadow],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => toggleSolde(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAmount(context),
                    Row(
                      children: [
                        Text(
                          "Solde",
                          style: context.bodyLarge.copyWith(
                            color: AppColors.textGrayColor1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        10.horizontalSpace,
                        Icon(
                          showSolde ? Iconsax.eye_slash : Iconsax.eye,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Assets.pngs.mainQrHome.image(width: 45)
            ],
          ),
          12.verticaleSpace,
          CustomButton(
            height: 43,
            label: "Déposer de l'argent",
            labelColor: AppColors.primary,
            fillColor: AppColors.containerColor2,
          ),
          6.verticaleSpace,
        ],
      ),
    );
  }

  SizedBox _buildAmount(BuildContext context) {
    return SizedBox(
      height: 35, // Hauteur dynamique (évite les sauts)
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Texte du solde (animé)
          FadeTransition(
            opacity: _fadeAnimation, // Animation de fade-in / fade-out
            child: Text(
              "1 950 F CFA",
              style: context.headlineLarge.copyWith(
                fontSize: 27,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // Icônes (animées aussi)
          FadeTransition(
            opacity: Tween<double>(begin: 1, end: 0).animate(_controller),
            child: Row(
              children: List.generate(
                3,
                (index) => Icon(Icons.emergency_sharp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
