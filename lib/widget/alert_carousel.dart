import 'package:carousel_slider/carousel_slider.dart';
import 'package:djamo_clone/models/alert.dart';
import 'package:djamo_clone/widget/alert_tile.dart';
import 'package:flutter/material.dart';

class AlertCarousel extends StatelessWidget {
  final List<Alert> items = Alert.alerts;

  AlertCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100, // Ajuste selon ton design
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return AlertTile(alert: item);
          },
        );
      }).toList(),
    );
  }
}
