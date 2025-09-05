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
import 'package:payment_learn_app/features/my_cart/presentation/controller/change_index/change_index_cubit.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/order_info_row_widget.dart';
import 'package:payment_learn_app/features/my_cart/presentation/view/widgets/payment_bottom_sheet_widget.dart';
import '../../../../../core/utilies/services/paypal_service.dart';
import '../../../../../generated/assets.dart';
import '../../../data/repos/checkout_repo/checkout_implementation_server_repo.dart';
import '../../controller/checkout/checkout_cubit.dart';
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
              showBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  backgroundColor: AppColors.backgroundThankYouColor,
                  elevation: 0,
                  context: context,
                  builder: (context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => CheckoutCubit(checkoutRepo: CheckoutImplementationServerRepo()),),
                        BlocProvider(create: (context) => ChangeIndexCubit(),),
                      ],
                      child: PaymentBottomSheetWidget(),
                    );
                  });
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
