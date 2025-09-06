import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/presentation/view/widgets/custom_credit_card_and_credit_form_widget.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/thank_you_screen.dart';

import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/widgets/custom_button_widget.dart';

class PaymentDetailsUiOnlyBody extends StatefulWidget {
  const PaymentDetailsUiOnlyBody({super.key});

  @override
  State<PaymentDetailsUiOnlyBody> createState() =>
      _PaymentDetailsUiOnlyBodyState();
}

class _PaymentDetailsUiOnlyBodyState extends State<PaymentDetailsUiOnlyBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 34)),
          SliverToBoxAdapter(child: CustomCreditCardAndCreditFormWidget(formKey: formKey,autoValidateMode: autoValidateMode,)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }else{
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder: (c){
                        return ThankYouScreen();
                      }));
                    }

                  },
                  horizontalPadding: 140,
                  verticalPadding: 15,
                  child: Text(AppTexts.pay, style: AppStyles.size22W500Inter),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
