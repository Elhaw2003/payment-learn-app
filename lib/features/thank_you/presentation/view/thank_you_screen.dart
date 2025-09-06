import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/thank_you_body.dart';

import '../../../../core/utilies/app_styles.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(AppTexts.thankYou,style: AppStyles.size25W500Inter,),
      ),
      body: ThankYouBody(),
    );
  }
}
