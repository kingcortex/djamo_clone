import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/pages/detail_transaction.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/utils/utils.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'ettiquette.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => TransactionDetailsPage())),
      child: Container(
        color: AppColors.secondary,
        height: 85,
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              foregroundImage: transaction.icon.image,
            ),
            15.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: context.bodySmall
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                switch (transaction.type) {
                  TransactionType.depot => depotEtiquette(context),
                  TransactionType.paiement => paiementEtiquette(context),
                  TransactionType.echec => echecEtiquette(context),
                },
                Text(
                  "17:02",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.textGrayColor1,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switch (transaction.type) {
                    TransactionType.depot =>
                      "+${Utils.formatAmount(transaction.amount)} F FCFA",
                    TransactionType.paiement =>
                      "-${Utils.formatAmount(transaction.amount)} F FCFA",
                    TransactionType.echec =>
                      "${Utils.formatAmount(transaction.amount)} F FCFA",
                  },
                  style: context.bodyMedium.copyWith(
                    decoration: transaction.type == TransactionType.echec
                        ? TextDecoration.lineThrough
                        : null,
                    fontWeight: FontWeight.w400,
                    color: switch (transaction.type) {
                      TransactionType.depot => AppColors.success,
                      TransactionType.paiement => AppColors.danger,
                      TransactionType.echec => AppColors.textGrayColor1,
                    },
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.containerColor2,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.arrow_right_3,
                    size: 14,
                    color: AppColors.primary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
