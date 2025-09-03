import 'package:dartz/dartz.dart';
import 'package:payment_learn_app/core/error/failure.dart';

import '../../models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure,void>> executePayment({required PaymentIntentInputModel paymentIntentInputModel});
}