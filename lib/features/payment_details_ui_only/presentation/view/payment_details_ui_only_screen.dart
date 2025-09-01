import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/core/widgets/custom_appbar_widget.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/presentation/view/widgets/payment_details_ui_only_body.dart';

class PaymentDetailsUiOnlyScreen extends StatelessWidget {
  const PaymentDetailsUiOnlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: CustomAppbarWidget(
          title: AppTexts.paymentDetails,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: PaymentDetailsUiOnlyBody(),
    );
  }
}
