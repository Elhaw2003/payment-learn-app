import 'package:flutter/material.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/continue_button_sheet_widget.dart';
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
          ContinueButtonSheetWidget(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
