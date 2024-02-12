import 'package:flutter/material.dart';

import '../utils/functions.dart';



class CustomPadding extends StatelessWidget {
  const CustomPadding({
    super.key,
    required this.widget,
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
  });
  final Widget widget;
  final double top;
  final double bottom;
  final double right;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: only(),
      child: widget,
    );
  }

  EdgeInsets only() {
    return EdgeInsets.only(
      top: top,
      bottom: bottom,
      right: isEnglish() ? right : 0,
      left: isEnglish() ? 0 : left,
    );
  }
}
