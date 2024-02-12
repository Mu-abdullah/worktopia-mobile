import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'default_texts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  context, {
  required String contentText,
  required int seconds,
  Color background = AppColor.navyColor,
  Color contentColor = AppColor.whiteColor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: background,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleText(
          text: contentText,
          maxLine: 3,
          isTitle: false,
          subTitleColor: contentColor,
        ),
      ],
    ),
    duration: Duration(seconds: seconds),
  ));
}
