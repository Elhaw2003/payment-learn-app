import 'package:flutter/material.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/data/models/payment_service_model.dart';

import '../../../../../core/utilies/app_colors.dart';

class ItemPaymentServiceListViewWidget extends StatelessWidget {
  const ItemPaymentServiceListViewWidget({super.key, required this.paymentServiceModel, required this.index, required this.i});
  final PaymentServiceModel paymentServiceModel;
  final int index;
  final int i;
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      width: 103,
      height: 62,
      duration: Duration(milliseconds: 300),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: index == i ? AppColors.greenColor : AppColors.greyColor, width: 1.5),
          ),
          shadows: [
            BoxShadow(
              color: index == i ? AppColors.greenColor: AppColors.whiteColor,
              blurRadius: 4,
              offset: Offset(0,0),
              spreadRadius: 0,
            ),
          ]
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColors.whiteColor),
        alignment: Alignment.center,
        child: Image.asset(paymentServiceModel.image,height: 30,width:70,),
      ),
    );
  }
}
