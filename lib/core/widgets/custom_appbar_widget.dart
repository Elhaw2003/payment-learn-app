import 'package:flutter/material.dart';

import '../utilies/app_styles.dart';
import '../utilies/app_texts.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios),),
      centerTitle: true,
      title:  Text(AppTexts.myCart,style: AppStyles.size25W500Inter,),
    );
  }
}
