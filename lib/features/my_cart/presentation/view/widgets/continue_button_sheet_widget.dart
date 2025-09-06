import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/features/my_cart/data/models/payment_intent_input_model.dart';
import 'package:payment_learn_app/features/my_cart/presentation/controller/checkout/checkout_states.dart';

import '../../../../../core/utilies/app_styles.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/utilies/services/paypal_service.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../thank_you/presentation/view/thank_you_screen.dart';
import '../../controller/change_index/change_index_cubit.dart';
import '../../controller/checkout/checkout_cubit.dart';

class ContinueButtonSheetWidget extends StatelessWidget {
  const ContinueButtonSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutStates>(
      listener: (context, state) {
        if (state is CheckoutSuccessState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c){
            return ThankYouScreen();
          }),
                (route) {
              if(route.settings.name == '/'){
                return true;
              }
              else{
                return false;
              }
            },
          );
        } else if (state is CheckoutFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.errorMessage,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is CheckoutLoadingState
            ? CircularProgressIndicator(backgroundColor: AppColors.whiteColor)
            : CustomButtonWidget(
                onPressed: (){
                  if(BlocProvider.of<ChangeIndexCubit>(context).index == 0){
                    BlocProvider.of<CheckoutCubit>(context).executePaymentCubit(paymentIntentInputModel: PaymentIntentInputModel(amount: 100, currency: "USD",customerId: "cus_SzaxrQXDIsycAQ"));
                  }
                  else if(BlocProvider.of<ChangeIndexCubit>(context).index == 1){
                    PaypalService.executePaypalPayment(context);
                  }
                },
                horizontalPadding: 100,
                verticalPadding: 15,
                child: Text(AppTexts.continu, style: AppStyles.size24W600Inter),
              );
      },
    );
  }
}
