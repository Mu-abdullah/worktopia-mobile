import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    this.size = 32,
    this.horizontalPadding = 32,
  });
  final String title;
  final double size;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.navyColor,
          fontSize: size,
          fontFamily: Constant.notoArabicFontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
