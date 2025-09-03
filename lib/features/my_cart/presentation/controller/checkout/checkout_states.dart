abstract class CheckoutStates {}

class CheckoutInitialState extends CheckoutStates {}

class CheckoutSuccessState extends CheckoutStates {}

class CheckoutFailureState extends CheckoutStates {
  final String errorMessage;
  CheckoutFailureState({ required this.errorMessage});
}

class CheckoutLoadingState extends CheckoutStates {}