import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';

class ContainerWithLabel extends StatelessWidget {
  const ContainerWithLabel(
      {super.key, required this.containerLable, required this.child});
  final String containerLable;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: containerLable,
        labelStyle: const TextStyle(
            fontSize: 36,
            color: AppColor.navyColor,
            fontFamily: Constant.notoArabicFontFamily),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constant.radius),
          borderSide: const BorderSide(
            color: AppColor.navyColor,
            width: 10,
          ),
        ),
      ),
      child: child,
    );
  }
}
