import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_styles.dart';

class OrderInfoRowWidget extends StatelessWidget {
  const OrderInfoRowWidget({super.key, required this.title, required this.value, this.titleTextStyle, this.valueTextStyle,});
  final String title;
  final String value;
  final TextStyle? titleTextStyle;
  final TextStyle? valueTextStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title,style: titleTextStyle?? AppStyles.size18W400Inter,)),
        Expanded(child: Text(value,style: valueTextStyle?? AppStyles.size18W400Inter,textAlign: TextAlign.end,)),
      ],
    );
  }
}
