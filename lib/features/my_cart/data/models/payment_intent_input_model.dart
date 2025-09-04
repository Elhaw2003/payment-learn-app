class PaymentIntentInputModel {
  final num amount;
  final String currency;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });
  toJson() => {
        'amount': (amount * 100).toString(),
        'currency': currency,
      };
}