import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';
import 'package:payment_learn_app/core/utilies/app_styles.dart';
import 'package:payment_learn_app/core/utilies/app_texts.dart';
import 'package:payment_learn_app/core/utilies/services/api_keys.dart';
import 'package:payment_learn_app/core/widgets/custom_button_widget.dart';
import 'package:payment_learn_app/core/widgets/custom_divider.dart';
import 'package:payment_learn_app/features/my_cart/data/models/transactions_model.dart';
import 'package:payment_learn_app/features/my_cart/presentation/controller/checkout/checkout_cubit.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/order_info_row_widget.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/payment_bottom_sheet_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../data/repos/checkout_repo/checkout_implementation_server_repo.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          Expanded(child: Image.asset(Assets.imagesCart,)),
          SizedBox(height: 25),
          OrderInfoRowWidget(title: AppTexts.orderSubtotal, value: "\$42,97"),
          OrderInfoRowWidget(title: AppTexts.discount, value: "\$0"),
          OrderInfoRowWidget(title: AppTexts.shipping, value: "\$8"),
          SizedBox(height: 17),
          CustomDivider(indent: 20, endIndent: 20),
          SizedBox(height: 15),
          OrderInfoRowWidget(
            title: AppTexts.total,
            value: "\$51,97",
            titleTextStyle: AppStyles.size24W600Inter,
            valueTextStyle: AppStyles.size24W600Inter,
          ),
          SizedBox(height: 15),
          CustomButtonWidget(
            onPressed: () {
              // showBottomSheet(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)
              //     ),
              //     backgroundColor: AppColors.backgroundThankYouColor,
              //     elevation: 0,
              //     context: context,
              //     builder: (context) {
              //       return BlocProvider(
              //         create: (context) => CheckoutCubit(checkoutRepo: CheckoutImplementationServerRepo()),
              //         child: PaymentBottomSheetWidget(),
              //       );
              //     });
              var transactions = getTransactions();
              executePaypalPayment(context,transactions);
            },
            horizontalPadding: 75,
            verticalPadding: 15,
            child: Text(
              AppTexts.completePayment,
              style: AppStyles.size22W500Inter,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
({AmountModel amount, ItemListModel itemList})getTransactions() {
  {
    var amount = AmountModel(total: "100",
        currency: "USD",
        details: DetailsModel(subtotal: "100", shipping: "0", shippingDiscount: 0));
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
executePaypalPayment(BuildContext context,({AmountModel amount, ItemListModel itemList}) transactions) {
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientIdPaypal,
          secretKey: ApiKeys.secretKeyPaypal,
          transactions:  [
            {
              "amount": transactions.amount.toJson(),
              "description": "The payment transaction description.",
              "payment_options": {
                "allowed_payment_method":
                "INSTANT_FUNDING_SOURCE"
              },
              "item_list": transactions.itemList.toJson()
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ));
}
