import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/functions.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    this.isTitle = true,
    required this.text,
    this.maxLine = 1,
    this.titleSize = 21,
    this.subTitleSize = 18,
    this.titleColor = AppColor.blackColor,
    this.subTitleColor = AppColor.blackColor,
  });

  final bool isTitle;

  final String text;
  final int maxLine;
  final double titleSize;
  final double subTitleSize;
  final Color titleColor;
  final Color subTitleColor;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: isTitle ? titleSize : subTitleSize,
      fontFamily: isEnglish()
          ? Constant.poppEnglishFontFamily
          : Constant.notoArabicFontFamily,
      color: _getTextColor(),
      overflow: TextOverflow.ellipsis,
    );

    return Text(
      text,
      maxLines: maxLine,
      style: style,
    );
  }

  Color _getTextColor() {
    if (isTitle) {
      return titleColor;
    } else {
      return subTitleColor;
    }
  }
}
