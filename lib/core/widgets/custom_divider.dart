import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.indent, required this.endIndent});
  final double indent;
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.greyColor,
      indent: indent,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
