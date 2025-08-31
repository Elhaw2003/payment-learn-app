import 'package:flutter/material.dart';
import 'package:payment_learn_app/core/utilies/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, this.onPressed, required this.child,  this.backgroundColor,  this.borderColor, required this.horizontalPadding, required this.verticalPadding});
  final void Function()? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double horizontalPadding;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: WidgetStatePropertyAll(backgroundColor??AppColors.greenColor),
          side: WidgetStatePropertyAll(BorderSide(color: borderColor??AppColors.greenColor,)),
        ),
        onPressed: onPressed,
        child: child,
    );
  }
}
