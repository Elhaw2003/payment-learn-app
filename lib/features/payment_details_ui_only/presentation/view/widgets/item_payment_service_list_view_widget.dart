import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/data/models/payment_service_model.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../my_cart/presentation/controller/change_index/change_index_cubit.dart';

class ItemPaymentServiceListViewWidget extends StatelessWidget {
  const ItemPaymentServiceListViewWidget({super.key, required this.paymentServiceModel, required this.index});
  final PaymentServiceModel paymentServiceModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      width: 103,
      height: 62,
      duration: Duration(milliseconds: 300),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: BlocProvider.of<ChangeIndexCubit>(context).index == index ? AppColors.greenColor : AppColors.greyColor, width: 1.5),
          ),
          shadows: [
            BoxShadow(
              color: BlocProvider.of<ChangeIndexCubit>(context).index == index ? AppColors.greenColor: AppColors.whiteColor,
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
