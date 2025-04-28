import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/pages/recap/page_1/p.dart';
import 'package:djamo_clone/pages/recap/page_1/widgets/earth_with_moon_animation.dart';
import 'package:djamo_clone/pages/recap/page_1/widgets/purple_planet_with_ring_animation.dart';
import 'package:djamo_clone/pages/recap/page_1/widgets/red_moon_animation.dart';
import 'package:djamo_clone/pages/recap/page_1/widgets/rocket.dart';
import 'package:djamo_clone/pages/recap/page_1/widgets/rotatation_animation_widget.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/yelow_planet_with_ring_animation.dart';

class RecapPage1 extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  const RecapPage1(
      {super.key, required this.screenHeight, required this.screenWidth});

  @override
  State<RecapPage1> createState() => _RecapPage1State();
}

class _RecapPage1State extends State<RecapPage1> with TickerProviderStateMixin {
  late final AnimationController globalAnimationController;
  late final AnimationController yellowPlanetWithRingContoller;
  late final AnimationController rocketAnimationController;
  late final AnimationController rocketSlideAnimationController;
  late final Animation<Offset> rocketSlideAnimation;
  @override
  void initState() {
    globalAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(hours: 1), //temps de l'animation globale
    )..repeat(); // Répète l'animation indéfiniment

    yellowPlanetWithRingContoller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Vitesse de rotation
    )..repeat(); //

    rocketAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    rocketSlideAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        if (rocketSlideAnimationController.status ==
            AnimationStatus.completed) {
          rocketAnimationController.repeat(reverse: true);
        }
      });
    rocketSlideAnimation = Tween<Offset>(
      // Par exemple, on démarre avec une translation négative en x et positive en y,
      // ce qui permet à la roquette de venir en diagonale vers la droite et vers le haut.
      begin: Offset(-widget.screenWidth * 0.6, widget.screenHeight * 0.1),
      end: Offset(widget.screenWidth * .22, -widget.screenHeight * .23),
    ).animate(CurvedAnimation(
        parent: rocketSlideAnimationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    globalAnimationController.dispose();
    yellowPlanetWithRingContoller.dispose();
    rocketAnimationController.dispose();
    rocketSlideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          _bg(screenWidth, screenHeight),
          Align(
            alignment: Alignment.bottomCenter,
            child: Assets.svgs.recapBg1.svg(alignment: Alignment.bottomCenter),
          ),
          Positioned(
            left: -screenWidth * .12,
            bottom: screenHeight * .25,
            child: EarthWithMoonAnimation(
              controller: globalAnimationController,
            ),
          ),
          Positioned(
            right: 0,
            top: screenHeight * .25,
            child: RedMoonAnimation(controller: globalAnimationController),
          ),
          Positioned(
            left: screenWidth * -0.01,
            top: screenHeight * .05,
            child: YelowPlanetWithRingAnimation(
                controller: yellowPlanetWithRingContoller),
          ),
          Positioned(
            right: screenWidth * -.08,
            top: screenHeight * -.08,
            child: PurplePlanetWithRingAnimation(
                controller: yellowPlanetWithRingContoller),
          ),
          Align(
            child: AnimatedBuilder(
              animation: rocketSlideAnimationController,
              builder: (BuildContext context, Widget? child) {
                // Définition d'une Tween pour interpoler l'offset.
                final offset = Tween<Offset>(
                  begin: Offset(-MediaQuery.of(context).size.width * 0.6,
                      MediaQuery.of(context).size.height * 0.1),
                  end: Offset(MediaQuery.of(context).size.width * 0.22,
                      -MediaQuery.of(context).size.height * 0.23),
                ).transform(CurvedAnimation(
                  parent: rocketSlideAnimationController,
                  curve: Curves.easeInOut,
                ).value);

                return Transform.translate(
                  offset: offset,
                  child: child,
                );
              },
              // Remplacez ce widget par votre widget Rocket personnalisé.
              child: Rocket(
                controller: rocketAnimationController,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (screenHeight * .34).toInt().verticaleSpace,
                Text(
                  "Mon année avec",
                  style: TextStyle(
                    //height: -.1,
                    fontWeight: FontWeight.w700,
                    fontSize: 38,
                    color: AppColors.basic200,
                  ),
                ),
                Text(
                  "DJAMO",
                  style: TextStyle(
                    height: 1,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 88,
                    color: AppColors.basic200,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Découvrez votre année 2024 morceau par morceau 😎",
                  style: TextStyle(
                    height: 0,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff76fedd),
                  ),
                ),
              ]
                  .animate(
                    interval: 100.ms,
                    delay: 600.ms,
                    autoPlay: true,
                    onComplete: (controller) {
                      rocketSlideAnimationController.forward();
                    },
                  )
                  .slide(
                      begin: Offset(-1.5, 0),
                      end: Offset.zero,
                      curve: Curves.easeInOut),
            ),
          )
        ],
      ),
    );
  }

  Container _bg(double screenWidth, double screenHeight) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff03161D), Color(0xff010101)],
        ),
      ),
      child: Stack(
        children: [
          StarsScreen(groupAOptions: [
            Assets.svgs.starBgVertical.svg(width: 10),
            Assets.svgs.starBgVertical.svg(),
            Assets.svgs.starBgTfBr.svg(width: 10),
            CircleAvatar(radius: 3),
            CircleAvatar(radius: 7),
            Assets.svgs.starBgTrBf.svg()
          ], groupBOptions: [
            Assets.svgs.starBgVertical.svg(),
            Assets.svgs.starBgTfBr.svg(),
            Assets.svgs.starBgTrBf.svg(),
            CircleAvatar(radius: 4),
            CircleAvatar(radius: 2),
            CircleAvatar(radius: 10),
          ]),
          Positioned(
            right: screenWidth * .25,
            top: screenHeight * .18,
            child: RotatationAnimationWidget(
              speed: .3,
              controller: globalAnimationController,
              child: Assets.svgs.yellowStar.svg(width: 25),
            ),
          ),
          Positioned(
            right: screenWidth * .32,
            bottom: screenHeight * .3,
            child: RotatationAnimationWidget(
              speed: .3,
              controller: globalAnimationController,
              child: Assets.svgs.orangeStar.svg(width: 25),
            ),
          ),
        ],
      ),
    );
  }
}
