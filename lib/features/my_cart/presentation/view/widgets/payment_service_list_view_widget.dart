import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_learn_app/features/my_cart/presentation/controller/change_index/change_index_cubit.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/data/models/payment_service_model.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/item_payment_service_list_view_widget.dart';

class PaymentServiceListViewWidget extends StatelessWidget {
  const PaymentServiceListViewWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: paymentServices.length,
      itemBuilder:  (context, index) {
        return GestureDetector(
          onTap: (){
            BlocProvider.of<ChangeIndexCubit>(context).changeIndex(index);
          },
            child: ItemPaymentServiceListViewWidget(
              index: index,
                paymentServiceModel: paymentServices[index]));
      },
      separatorBuilder: (context, index) => SizedBox(width: 20,),
    );
  }
}
