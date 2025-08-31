import '../../../../generated/assets.dart';

class PaymentServiceModel {
  final String image;

  PaymentServiceModel({required this.image});
}

List<PaymentServiceModel> paymentServices = [
  PaymentServiceModel(image: Assets.imagesCard),
  PaymentServiceModel(image: Assets.imagesPaypal),
];