import 'package:flutter/material.dart';

import '../utilies/app_styles.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, this.onPressed,  this.title});
  final VoidCallback? onPressed;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios),),
      centerTitle: true,
      // title:  Text(title!,style: AppStyles.size25W500Inter,),
    );
  }
}
