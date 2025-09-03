import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/core/utilies/services/manage_cubit_servise.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/my_cart_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(PaymentApp());
}
class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.whiteColor
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MyCartScreen(),
    );
  }
}
