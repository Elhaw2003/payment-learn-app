import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_styles.dart';
import 'package:payment_learn_app/core/widgets/custom_button_widget.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/presentation/view/widgets/payment_service_list_view_widget.dart';

class PaymentBottomSheetWidget extends StatelessWidget {
  const PaymentBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          SizedBox(height: 62, child: PaymentServiceListViewWidget()),
          SizedBox(height: 50),
          CustomButtonWidget(horizontalPadding: 100, verticalPadding: 15, child: Text("Continue",style: AppStyles.size24W600Inter,)),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
