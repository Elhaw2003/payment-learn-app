import 'package:bloc/bloc.dart';
import 'package:payment_learn_app/features/my_cart/data/repos/checkout_repo/checkout_repo.dart';

import '../../../data/models/payment_intent_input_model.dart';
import 'checkout_states.dart';
class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutInitialState());
  final CheckoutRepo checkoutRepo;

  Future<void> executePaymentCubit({required PaymentIntentInputModel paymentIntentInputModel}) async{

    emit(CheckoutLoadingState());

    var result = await checkoutRepo.executePayment(paymentIntentInputModel: paymentIntentInputModel);

    return result.fold(
            (left){
              emit(CheckoutFailureState(errorMessage: left.message));
            },
            (right){
              emit(CheckoutSuccessState());
            }
    );
  }

}