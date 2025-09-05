import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_learn_app/core/utilies/services/api_keys.dart';
import 'package:payment_learn_app/core/utilies/services/api_service.dart';
import 'package:payment_learn_app/features/my_cart/data/models/ephemeral_key_model.dart';
import 'package:payment_learn_app/features/my_cart/data/models/init_payment_sheet_input_model.dart';

import '../../../features/my_cart/data/models/payment_intent_input_model.dart';
import '../../../features/my_cart/data/models/payment_intent_model.dart';
import '../end_points.dart';

class StripeService {
  final ApiService apiService = ApiService();

  // createPaymentIntent (amount , currency , customer id)

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: EndPoints.baseUrl + EndPoints.createPaymentIntent,
      token: ApiKeys.secretKeyStripe,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // Create an Ephemeral Key for the Customer(stripe version , customer id)

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {"customer": customerId},
      url: EndPoints.baseUrl + EndPoints.ephemeralKey,
      token: ApiKeys.secretKeyStripe,
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        "Stripe-Version": "2025-08-27.basil",
        "Authorization": "Bearer ${ApiKeys.secretKeyStripe}",
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  // init payment sheet (merchant display name , payment intent client secret , ephemeral key , customer id)

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // main parameters
        merchantDisplayName: "Ibrahim",
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  // display payment sheet

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // method for execute all payment

  Future executePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
      initPaymentSheetInputModel: InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: paymentIntentInputModel.customerId,
      ),
    );
    await displayPaymentSheet();
  }
}
