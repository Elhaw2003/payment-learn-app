import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/circle_widget.dart';
import 'package:payment_learn_app/features/thank_you/presentation/view/widget/thank_you_container_widget.dart';

import 'dash_line_seperator_widget.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24,),
                child: ThankYouContainerWidget(),
              ),
              Positioned(
                left: -2,
                bottom: MediaQuery.of(context).size.height * 0.23,
                child: CircleWidget(),
              ),
              Positioned(
                right: -2,
                bottom: MediaQuery.of(context).size.height * 0.23,
                child: CircleWidget(),
              ),
              Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: CircleWidget(
                  color: AppColors.backgroundThankYouColor,
                  radius: 50,
                  child: CircleWidget(
                    color: AppColors.greenColor,
                    radius: 40,
                    child: Icon(Icons.check, color: AppColors.whiteColor,size: 50,),
                  ),
                ),
              ),
              Positioned(
                  left: 55,
                  right: 55,
                  bottom: MediaQuery.of(context).size.height * 0.23+25,
                  child: DashLineSeparatorWidget(),
              ),
              // Positioned(
              //   left: 10,
              //   top: -60,
              //   child: IconButton(
              //       onPressed: (){
              //         print("kdfnlkkkkkkkc")
              //     Navigator.pop(context);
              //   }, icon: Icon(Icons.arrow_back_ios_new)),
              // )
            ],
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
