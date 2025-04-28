import 'package:djamo_clone/pages/recap/page_1/view/recap_page_1.dart';
import 'package:flutter/material.dart';

class MainRecapPage extends StatelessWidget {
  const MainRecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        PageView(
          children: [
            RecapPage1(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          ],
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
