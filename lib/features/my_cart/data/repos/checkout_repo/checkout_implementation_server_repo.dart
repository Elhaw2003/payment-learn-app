import 'package:dartz/dartz.dart';

import 'package:payment_learn_app/core/error/failure.dart';
import 'package:payment_learn_app/core/utilies/services/stripe_service.dart';

import 'package:payment_learn_app/features/my_cart/data/models/payment_intent_input_model.dart';

import 'checkout_repo.dart';

class CheckoutImplementationServerRepo implements CheckoutRepo{
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> executePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    
    try{


      await stripeService.executePayment(paymentIntentInputModel: paymentIntentInputModel);

      return right(null);

    }catch(e){

      return left(ServerFailure(message: e.toString()));
    }

  }
  
}