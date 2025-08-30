import 'package:flutter/material.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/my_cart_screen.dart';

void main(){
  runApp(PaymentApp());
}
class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartScreen(),
    );
  }
}
