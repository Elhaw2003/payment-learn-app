import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_styles.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/my_cart_body.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title:  Text(AppTexts.myCart,style: AppStyles.size25W500Inter,),
      ),
      body: MyCartBody(),
    );
  }
}
