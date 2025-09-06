import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/thank_you_body.dart';

import '../../../../core/widgets/custom_appbar_widget.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: CustomAppbarWidget(
          title: AppTexts.thankYou,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ThankYouBody(),
    );
  }
}
