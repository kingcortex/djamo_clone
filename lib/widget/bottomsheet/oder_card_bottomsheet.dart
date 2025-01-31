import 'package:djamo_clone/gen/assets.gen.dart';
import 'package:djamo_clone/theme/colors/app_colors.dart';
import 'package:djamo_clone/utils/extention.dart';
import 'package:djamo_clone/widget/credit_card.dart';
import 'package:djamo_clone/widget/custom_button.dart';
import 'package:flutter/material.dart';

void showOrderCardBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Color(0xfffafafa),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return OrderCardBottomSheet();
    },
  );
}

class OrderCardBottomSheet extends StatelessWidget {
  const OrderCardBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          CreditCardDjamo(),
          SizedBox(height: 10),
          Text(
            'Commandez votre carte physique',
            style: context.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          30.verticaleSpace,
          _infoItem(
            context,
            icon: Assets.svgs.oderCardIc1.svg(),
            text:
                'Des retraits gratuits au guichet dans tous les pays de la zone UEMOA',
          ),
          _infoItem(
            context,
            icon: Assets.svgs.oderCardIc2.svg(),
            text: 'Augmentez votre volume de transaction à 10 millions F',
          ),
          (MediaQuery.sizeOf(context).height * .15).toInt().verticaleSpace,
          CustomButton(height: 50, label: 'Commander la carte à 2.000 F CFA'),
          15.verticaleSpace,
        ],
      ),
    );
  }
}

Widget _infoItem(BuildContext context,
    {required Widget icon, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          child: icon,
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: context.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
