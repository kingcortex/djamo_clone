import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Alert {
  final Widget icon;
  final bool isRecap;
  final String title;
  final String messge;

  Alert(
      {required this.title,
      required this.messge,
      required this.icon,
      required this.isRecap});

  static List<Alert> alerts = [
    Alert(
        isRecap: true,
        title: "Mon Année 2024 avec Djamo",
        messge:
            "Revivez votre année 2024 avec",
        icon: Assets.svgs.gift.svg()),
    Alert(
        isRecap: false,
        title: "Rachats NSIA INVEST",
        messge:
            "Les rachats vers NSIA INVEST sont momentanément indisponibles 📱",
        icon: Assets.pngs.transCancel.image(width: 30)),
  ];
}
