import 'dart:math';

import 'package:djamo_clone/pages/recap/page_1/widgets/purple_planet_with_ring_widget.dart';
import 'package:flutter/material.dart';

class PurplePlanetWithRingAnimation extends StatefulWidget {
  final AnimationController controller;
  const PurplePlanetWithRingAnimation({super.key, required this.controller});

  @override
  State<PurplePlanetWithRingAnimation> createState() =>
      _PurplePlanetWithRingAnimationState();
}
class _PurplePlanetWithRingAnimationState
    extends State<PurplePlanetWithRingAnimation> {
  // Définition de l'amplitude de l'oscillation (en radians)
  final double amplitude = 0.2;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double t = widget.controller.value;
          double phase;
          // Seuil de temps pour passer de l'oscillation rapide à l'oscillation lente
          const double t0 = 0.2;
          // Facteurs de fréquence :
          // - Pendant t < t0, l'oscillation est rapide (par exemple 5 oscillations complètes)
          // - Pour t >= t0, l'oscillation devient plus lente (par exemple 1 oscillation complète sur le reste)
          const double freqRapide = 3.0;
          const double freqLente = .9;

          if (t < t0) {
            phase = freqRapide * t;
          } else {
            // On calcule la phase de manière continue en ajoutant le décalage correspondant au premier segment
            phase = freqRapide * t0 + freqLente * (t - t0);
          }

          // Calcul de l'angle via la fonction sinus pour obtenir un effet oscillatoire
          double angle = amplitude * sin(phase * 2 * -((2 * pi) / 3));

          return Transform.rotate(
            angle: angle,
            child: child,
          );
        },
        child: PurplePlanetWithRingWidget(),
      ),
    );
  }
}