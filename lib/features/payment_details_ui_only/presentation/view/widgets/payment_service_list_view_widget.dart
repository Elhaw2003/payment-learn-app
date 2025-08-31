import 'package:flutter/material.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/data/models/payment_service_model.dart';
import 'package:payment_learn_app/features/payment_details_ui_only/presentation/view/widgets/item_payment_service_list_view_widget.dart';

class PaymentServiceListViewWidget extends StatefulWidget {
  const PaymentServiceListViewWidget({super.key});

  @override
  State<PaymentServiceListViewWidget> createState() => _PaymentServiceListViewWidgetState();
}

class _PaymentServiceListViewWidgetState extends State<PaymentServiceListViewWidget> {
  int index = 0;
  changeIndex(index){
    setState(() {
      this.index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: paymentServices.length,
      itemBuilder:  (context, i) {
        return GestureDetector(
          onTap: (){
            changeIndex(i);
          },
            child: ItemPaymentServiceListViewWidget(
              index: index,
                i: i,
                paymentServiceModel: paymentServices[i]));
      },
      separatorBuilder: (context, i) => SizedBox(width: 20,),
    );
  }
}
