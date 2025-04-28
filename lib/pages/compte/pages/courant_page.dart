import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/models/transaction.dart';
import 'package:djamo_clone/utils/constant.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/action_widget.dart';
import 'package:djamo_clone/widget/alert_carousel.dart';
import 'package:djamo_clone/widget/alert_tile.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:djamo_clone/widget/plafond_widget.dart';
import 'package:djamo_clone/widget/solde_widget.dart';
import 'package:djamo_clone/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CourantPage extends StatefulWidget {
  const CourantPage({super.key});

  @override
  State<CourantPage> createState() => _CourantPageState();
}

class _CourantPageState extends State<CourantPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  final List<String> actionTitles = [
    "Transfert",
    "Investir",
    "N° de compte",
    "Factures",
    "Abonnements",
    "Conversion"
  ];
  final List<SvgGenImage> actionIcon = [
    Assets.svgs.transferIcon,
    Assets.svgs.coinHand,
    Assets.svgs.ibanIcon,
    Assets.svgs.factureIcon,
    Assets.svgs.aboIcon,
    Assets.svgs.icone6,
  ];

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: false,
      enablePullDown: true,
      header: ClassicHeader(
        textStyle: context.bodyMedium.copyWith(color: AppColors.textGrayColor1),
        spacing: 10,
        refreshingText: "Rafraîchissement...",
        failedText: "Mise à jour échouée",
        idleText: "Tirez pour rafraîchir",
        releaseText: "Relachez pour rafraîchir",
        completeText: "Rafraîchissement terminé",
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                20.verticaleSpace,
                SoldeWidget(),
                20.verticaleSpace,
                SizedBox(
                  height: 160,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 3 colonnes
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: actionTitles.length,
                    itemBuilder: (context, index) {
                      return ActionWidget(
                        showBadge: index == 0,
                        actionIcon: actionIcon[index],
                        actionTitles: actionTitles[index],
                      );
                    },
                  ),
                ),
                15.verticaleSpace,
                PlafondWidget(),
                15.verticaleSpace,
              ],
            ),
          ),
          10.verticaleSpace,
          AlertCarousel(),
          20.verticaleSpace,
          _buildTransactionSection(context)
        ],
      ),
    );
  }

  Widget _buildTransactionSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appPadding - 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Tout afficher",
                  style: context.bodyMedium.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
          10.verticaleSpace,
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dateWidget(context, date: "Aujourd'hui"),
                ...Transaction.today.map(
                  (item) => Column(
                    children: [
                      TransactionTile(
                        transaction: item,
                      ),
                      Divider(
                        thickness: 0.6,
                        color: Color(0xffe6e5e6),
                        height: 35,
                      )
                    ],
                  ),
                ),
                _dateWidget(context, date: 'Hier'),
                ...Transaction.yesterday.map(
                  (item) => Column(
                    children: [
                      TransactionTile(transaction: item),
                      Divider(
                        thickness: 0.6,
                        color: Color(0xffe6e5e6),
                        height: 30,
                      )
                    ],
                  ),
                ),
                _dateWidget(context, date: '27/01/2025'),
                ...Transaction.date_27.map(
                  (item) => Column(
                    children: [
                      TransactionTile(transaction: item),
                      Divider(
                        thickness: 0.6,
                        color: Color(0xffe6e5e6),
                        height: 30,
                      )
                    ],
                  ),
                ),
                _dateWidget(context, date: '26/01/2025'),
                ...Transaction.date_26.map(
                  (item) => Column(
                    children: [
                      TransactionTile(transaction: item),
                      Divider(
                        thickness: 0.6,
                        color: Color(0xffe6e5e6),
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dateWidget(BuildContext context, {required String date}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: Text(
        date,
        style: context.bodyLarge.copyWith(
          fontWeight: FontWeight.normal,
          color: AppColors.textGrayColor1,
        ),
      ),
    );
  }
}
