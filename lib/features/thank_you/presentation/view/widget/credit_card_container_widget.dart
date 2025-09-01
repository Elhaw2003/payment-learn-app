import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';

import '../../../../../generated/assets.dart';

class CreditCardContainerWidget extends StatelessWidget {
  const CreditCardContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SvgPicture.asset(Assets.imagesLogo),
        title: Text("Credit Card"),
        subtitle: Text("Mastercard **78"),
      ),
    );
  }
}
