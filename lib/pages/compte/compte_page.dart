import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/models/transaction.dart';
import 'package:djamo_clone/pages/compte/pages/account_number_page.dart';
import 'package:djamo_clone/pages/compte/pages/courant_page.dart';
import 'package:djamo_clone/utils/constant.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/alert_carousel.dart';
import 'package:djamo_clone/widget/alert_tile.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:djamo_clone/widget/plafond_widget.dart';
import 'package:djamo_clone/widget/solde_widget.dart';
import 'package:djamo_clone/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../widget/cutom_tab_item.dart';

class ComptePage extends StatefulWidget {
  const ComptePage({super.key});

  @override
  State<ComptePage> createState() => _ComptePageState();
}

class _ComptePageState extends State<ComptePage> {
  int _selectedTabIndex = 0;
  final PageController _pageController = PageController();

  final List<String> labels = [
    "Courant",
    "N° de compte",
    "Coffres",
    "Investir",
  ];

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, _) => [
        SliverToBoxAdapter(
          child: Column(
            children: [
              15.verticaleSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding),
                child: SizedBox(
                  height: 45,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: labels.length,
                    separatorBuilder: (context, index) => 10.horizontalSpace,
                    itemBuilder: (context, index) => CutomTabItem(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      labels: labels[index],
                      selected: index == _selectedTabIndex,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        children: const [
          CourantPage(),
          AccountNumberPage(),
          Center(child: Text("Coffres")),
          Center(child: Text("Investir")),
        ],
      ),
    );
  }
}
