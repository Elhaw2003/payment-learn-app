import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/core/utilies/app_styles.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/core/widgets/custom_button_widget.dart';
import 'package:payment_learn_app/core/widgets/custom_divider.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/order_info_row_widget.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/payment_bottom_sheet_widget.dart';
import '../../../../../generated/assets.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          Expanded(child: Image.asset(Assets.imagesCart,)),
          SizedBox(height: 25),
          OrderInfoRowWidget(title: AppTexts.orderSubtotal, value: "\$42,97"),
          OrderInfoRowWidget(title: AppTexts.discount, value: "\$0"),
          OrderInfoRowWidget(title: AppTexts.shipping, value: "\$8"),
          SizedBox(height: 17),
          CustomDivider(indent: 20, endIndent: 20),
          SizedBox(height: 15),
          OrderInfoRowWidget(
            title: AppTexts.total,
            value: "\$51,97",
            titleTextStyle: AppStyles.size24W600Inter,
            valueTextStyle: AppStyles.size24W600Inter,
          ),
          SizedBox(height: 15),
          CustomButtonWidget(
            onPressed: (){
              showBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                backgroundColor: AppColors.backgroundThankYouColor,
                  elevation: 0,
                  context: context, builder: (context) {
                return PaymentBottomSheetWidget();
              });
            },
            horizontalPadding: 75,
            verticalPadding: 15,
            child: Text(
              AppTexts.completePayment,
              style: AppStyles.size22W500Inter,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
