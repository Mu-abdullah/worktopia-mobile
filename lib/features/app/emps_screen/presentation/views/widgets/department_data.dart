import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/colors.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

class DepartmentData extends StatelessWidget {
  const DepartmentData({
    super.key,
    required this.company,
  });
  final String company;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      text: company,
      subTitleColor: AppColor.navyColor,
      maxLine: 5,
      isTitle: false,
    );
  }
}
