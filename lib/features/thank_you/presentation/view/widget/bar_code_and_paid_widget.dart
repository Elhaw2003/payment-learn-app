import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/core/utilies/app_styles.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/core/widgets/custom_button_widget.dart';

class BarCodeAndPaidWidget extends StatelessWidget {
  const BarCodeAndPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(FontAwesomeIcons.barcode,size: 80,),
        CustomButtonWidget(horizontalPadding: 20, verticalPadding: 18,backgroundColor: Colors.transparent, child: Text(AppTexts.paid,style: AppStyles.size24W600Inter.copyWith(color: AppColors.greenColor),),)
      ],
    );
  }
}
