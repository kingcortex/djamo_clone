import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/utils/utils.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../utils/container_box_shadow.dart';

class PlafondWidget extends StatefulWidget {
  const PlafondWidget({super.key});

  @override
  PlafondWidgetState createState() => PlafondWidgetState();
}

class PlafondWidgetState extends State<PlafondWidget> {
  double plafond = 200000; // Plafond actuel
  double minValue = 450;
  double maxValue = 2000000;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [containerBoxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Plafond Limité à ${Utils.formatAmount(plafond.toInt())} F CFA",
            style: context.titleSmall.copyWith(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          8.verticaleSpace,
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffe4e4ec),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  height: 20,
                  width: 3,
                  color: Color(0xffe4e4ec),
                ),
              )
            ],
          ),
          2.verticaleSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${minValue.toInt()} F CFA",
                  style: context.bodySmall.copyWith(fontSize: 13)),
              Text("${maxValue.toInt()} F CFA",
                  style: context.bodySmall.copyWith(fontSize: 13)),
            ],
          ),
          SizedBox(height: 16),
          CustomButton(label: "Commander une carte physique")
        ],
      ),
    );
  }
}
