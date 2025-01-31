import 'package:djamo_clone/Iconsax/flutter/iconsax_icons.dart';
import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/container_box_shadow.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/ettiquette.dart';
import 'package:djamo_clone/widget/loading.dart';
import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBg,
        title: Text(
          'Détails de transaction',
          style: context.titleMedium,
        ),
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
          future: Future.delayed(Durations.medium4),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _body(context);
            } else {
              return Center(child: Loading());
            }
          }),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+1.980 F CFA',
                    style: context.headlineSmall.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'De +2250153013761',
                    style:
                        context.bodyMedium.copyWith(color: AppColors.tertiary),
                  ),
                  SizedBox(height: 4),
                  depotEtiquette(
                    context,
                  )
                ],
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: Assets.pngs.wave.image().image,
              ),
            ],
          ),
          16.verticaleSpace,
          _infoCard(context),
          16.verticaleSpace,
          _referenceCard(context),
          16.verticaleSpace,
          _downloadButton(context),
          16.verticaleSpace,
          _reportButton(context),
          Spacer(),
        ],
      ),
    );
  }

  Widget _infoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [containerBoxShadow]),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(context, 'Date & heure', '29/01/2025 21:55'),
          _infoRow(context, 'Statut', 'Effectuée', color: AppColors.success),
          _infoRow(context, 'Montant', '2.000 F CFA'),
          _infoRow(context, 'Frais', '20 F CFA'),
          _infoRow(context, 'Nouveau Solde', '1.980 F CFA'),
        ],
      ),
    );
  }

  Widget _referenceCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [containerBoxShadow]),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text('Référence',
            style: context.bodyLarge.copyWith(
              color: AppColors.textGrayColor1,
            )),
        subtitle: Text('DJAMOM6IG2Y0WQPTDZWVTYHC', style: context.bodyLarge),
        trailing: Icon(
          Icons.copy,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _downloadButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [containerBoxShadow],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(context, "Operator", "Wave"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reçu',
                style: context.bodyLarge.copyWith(
                  color: AppColors.textGrayColor1,
                ),
              ),
              TextButton.icon(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                onPressed: () {},
                icon: Icon(Icons.download),
                label: Text('Télécharger'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _reportButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [containerBoxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Icon(Icons.warning_amber_rounded, color: Colors.red),
        title: Text(
          'Signaler un problème',
          style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Iconsax.arrow_right_3,
          size: 20,
          color: AppColors.basic900,
        ),
        onTap: () {},
      ),
    );
  }

  Widget _infoRow(BuildContext context, String title, String value,
      {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: context.bodyLarge.copyWith(
                color: AppColors.textGrayColor1,
              )),
          Text(value, style: context.bodyLarge.copyWith(color: color)),
        ],
      ),
    );
  }
}
