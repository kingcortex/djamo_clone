import 'package:djamo_clone/app.dart';
import 'package:djamo_clone/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  //debugRepaintRainbowEnabled = true; // Active l'effet visuel
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showSemanticsDebugger: true,
      //debugShowMaterialGrid: true,
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: App(),
    );
  }
}
