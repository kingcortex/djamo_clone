import 'dart:math';
import 'package:flutter/material.dart';

/// Une classe simple qui regroupe la position et le widget choisi pour l'étoile.
class StarData {
  final Offset position;
  final Widget starWidget;
  StarData({required this.position, required this.starWidget});
}

class StarsScreen extends StatefulWidget {
  // Listes de widgets possibles pour chaque groupe
  final List<Widget> groupAOptions;
  final List<Widget> groupBOptions;
  // Nombre d'étoiles pour chaque groupe
  final int numStarsGroupA;
  final int numStarsGroupB;

  const StarsScreen({
    super.key,
    required this.groupAOptions,
    required this.groupBOptions,
    this.numStarsGroupA = 10,
    this.numStarsGroupB = 10,
  });

  @override
  _StarsScreenState createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<StarData> groupAStars;
  late List<StarData> groupBStars;

  @override
  void initState() {
    super.initState();
    // Animation qui alterne l'opacité entre 0 et 1, en mode aller-retour.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    generateRandomStars();
  }

  /// Génère pour chaque groupe une liste d'étoiles avec une position aléatoire et
  /// en sélectionnant un widget aléatoire depuis la liste correspondante.
  void generateRandomStars() {
    final random = Random();
    groupAStars = List.generate(widget.numStarsGroupA, (_) {
      final pos = Offset(random.nextDouble(), random.nextDouble());
      // Sélection aléatoire d'un widget depuis groupAOptions.
      final starWidget =
          widget.groupAOptions[random.nextInt(widget.groupAOptions.length)];
      return StarData(position: pos, starWidget: starWidget);
    });
    groupBStars = List.generate(widget.numStarsGroupB, (_) {
      final pos = Offset(random.nextDouble(), random.nextDouble());
      final starWidget =
          widget.groupBOptions[random.nextInt(widget.groupBOptions.length)];
      return StarData(position: pos, starWidget: starWidget);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder permet de récupérer les dimensions de l'écran.
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Le groupe A a une opacité basée sur la valeur de l'animation,
          // et le groupe B l'opposé (clignotement inversé).
          double opacityA = _controller.value;
          double opacityB = 1.0 - _controller.value;

          return Stack(
            children: [
              // Affichage du groupe A
              for (var star in groupAStars)
                Positioned(
                  left: star.position.dx * constraints.maxWidth,
                  top: star.position.dy * constraints.maxHeight,
                  child: Opacity(
                    opacity: opacityA,
                    child: star.starWidget,
                  ),
                ),
              // Affichage du groupe B
              for (var star in groupBStars)
                Positioned(
                  left: star.position.dx * constraints.maxWidth,
                  top: star.position.dy * constraints.maxHeight,
                  child: Opacity(
                    opacity: opacityB,
                    child: star.starWidget,
                  ),
                ),
            ],
          );
        },
      );
    });
  }
}
