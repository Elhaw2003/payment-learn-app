import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../features/my_cart/data/models/transactions_model.dart';
import '../../../features/thank_you/presentation/view/thank_you_screen.dart';
import 'api_keys.dart';

class PaypalService{
  static({AmountModel amount, ItemListModel itemList})getTransactions() {
    // subTotal =  (price * quantity) for ItemModel1 + (price * quantity) for ItemModel2 + (price * quantity) for ItemModel3 >>>>> extra .......

    // total = ( subTotal - shipping discount ) + shipping

    // shipping discount is value not percentage

    {
      var amount = AmountModel(
          total: "100",
          currency: "USD",
          details: DetailsModel(subtotal: "100", shipping: "0", shippingDiscount: 0 ));
      List<ItemModel> items = [
        ItemModel(
          name: "Apple",
          quantity: 10,
          price: "5",
          currency: "USD",
        ),
        ItemModel(
          name: "Pineapple",
          quantity: 5,
          price: "10",
          currency: "USD",
        ),
      ];
      var itemList = ItemListModel(items: items);
      return (amount : amount,itemList : itemList);
    }
  }
 static executePaypalPayment(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: ApiKeys.clientIdPaypal,
            secretKey: ApiKeys.secretKeyPaypal,
            transactions:  [
              {
                "amount": getTransactions().amount.toJson(),
                "description": "The payment transaction description.",
                "payment_options": {
                  "allowed_payment_method":
                  "INSTANT_FUNDING_SOURCE"
                },
                "item_list": getTransactions().itemList.toJson()
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('Payment Done',style: TextStyle(color: Colors.white),),));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                return ThankYouScreen();
              }));
            },
            onError: (error) {
              print("onError: $error");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text(error.toString(),style: TextStyle(color: Colors.white),),));
              Navigator.pop(context);
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ));
  }
}