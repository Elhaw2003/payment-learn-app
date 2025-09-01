import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/widgets/custom_divider.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/order_info_row_widget.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/bar_code_and_paid_widget.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/credit_card_container_widget.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/utilies/app_texts.dart';

class ThankYouContainerWidget extends StatelessWidget {
  const ThankYouContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundThankYouColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Center(child: Text(AppTexts.thankYou,style: AppStyles.size25W500Inter,)),
          Text(AppTexts.yourTransactionWasSuccessful,style: AppStyles.size18W600Inter.copyWith(fontWeight: FontWeight.w400,color: AppColors.blackColor.withOpacity(0.6)),),
          SizedBox(height: 30,),
          OrderInfoRowWidget(title: "Date", value: "01/24/2023",valueTextStyle: AppStyles.size18W600Inter,),
          SizedBox(height: 15,),
          OrderInfoRowWidget(title: "Time", value: "10:15 AM",valueTextStyle: AppStyles.size18W600Inter,),
          SizedBox(height: 15,),
          OrderInfoRowWidget(title: "To", value: "Sam Louis",valueTextStyle: AppStyles.size18W600Inter,),
          SizedBox(height: 25,),
          CustomDivider(indent: 0, endIndent: 0),
          SizedBox(height: 20,),
          OrderInfoRowWidget(title: AppTexts.total, value: "\$50.97",valueTextStyle: AppStyles.size24W600Inter,titleTextStyle: AppStyles.size24W600Inter,),
          SizedBox(height: 30,),
          CreditCardContainerWidget(),
          Spacer(),
          BarCodeAndPaidWidget(),
          SizedBox(height: (MediaQuery.of(context).size.height * 0.23 /2)-25,)
      ]
      ),
    );
  }
}
