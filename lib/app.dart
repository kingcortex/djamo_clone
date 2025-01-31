import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/pages/carte_page.dart';
import 'package:djamo_clone/pages/compte/compte_page.dart';
import 'package:djamo_clone/pages/statistiques_page.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/constant.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'widget/cutom_tab_item.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _pages = [ComptePage(), StatistiquesPage(), CartePage()];
  int _currentPageIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppColors.mainBg,
        toolbarHeight: 35,
        leading: Builder(builder: (context_) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context_).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        }),
        actions: _currentPageIndex == 0
            ? [
                Assets.pngs.secondQrHome.image(width: 25),
                20.horizontalSpace,
                Assets.pngs.assitIcon.image(width: 28),
                appPadding.ceil().horizontalSpace
              ]
            : null,
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.secondary,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.basic600,
          onTap: (value) {
            _changePage(value);
          },
          items: [
            _buildBottomNavigationBarItem(
              iconBold: Assets.svgs.walletBold,
              iconLinear: Assets.svgs.walletLinear,
              label: 'Compte',
              index: 0,
              currentIndex: _currentPageIndex,
            ),
            _buildBottomNavigationBarItem(
              iconBold: Assets.svgs.iconStatsBold,
              iconLinear: Assets.svgs.iconStatsLinear,
              iconSize: 25,
              label: 'Statistiques',
              index: 1,
              currentIndex: _currentPageIndex,
            ),
            _buildBottomNavigationBarItem(
              iconBold: Assets.svgs.cardBold,
              iconLinear: Assets.svgs.cardLinear,
              label: 'Cartes',
              index: 2,
              currentIndex: _currentPageIndex,
            ),
          ]),
    );
  }

  _buildBottomNavigationBarItem(
      {required SvgGenImage iconBold,
      required SvgGenImage iconLinear,
      double? iconSize,
      required String label,
      required int index,
      required int currentIndex}) {
    return BottomNavigationBarItem(
      icon: _currentPageIndex == index
          ? iconBold.svg(color: AppColors.primary, width: iconSize)
          : iconLinear.svg(color: AppColors.basic600, width: iconSize),
      label: label,
    );
  }
}
