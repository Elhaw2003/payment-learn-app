import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_learn_app/core/utilies/services/api_keys.dart';
import 'package:payment_learn_app/core/utilies/services/api_service.dart';

import '../../../features/my_cart/data/models/payment_intent_input_model.dart';
import '../../../features/my_cart/data/models/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  // createPaymentIntent (amount , currency)

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async{
   var response = await apiService.post(body: paymentIntentInputModel.toJson(), url: "https://docs.stripe.com/api/payment_intents/create", token: ApiKeys.secretKey);
   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
   return paymentIntentModel;
  }

  // init payment sheet

  Future initPaymentSheet({required String paymentIntentClientSecret})async {
   await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
     // main parameters
      merchantDisplayName: "Ibrahim",
        paymentIntentClientSecret: paymentIntentClientSecret,
    ));
  }

  // display payment sheet

   Future displayPaymentSheet()async {

    await Stripe.instance.presentPaymentSheet();

   }

   // method for execute all payment

      Future executePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
         var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
         await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret!);
         await displayPaymentSheet();
      }


}