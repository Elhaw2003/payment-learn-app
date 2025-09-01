import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key, this.color, this.radius, this.child});
  final Color? color ;
  final double? radius ;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:color?? AppColors.whiteColor,
      radius: radius ??25,
      child: child,
    );
  }
}
