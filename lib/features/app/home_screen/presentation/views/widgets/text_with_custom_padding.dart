import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';

class HomeTextWithCustomPadding extends StatelessWidget {
  const HomeTextWithCustomPadding({
    super.key,
    required this.text,
    this.isTitle = false,
    this.fontSize = 21,
  });

  final String text;
  final bool isTitle;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: TitleText(
        isTitle: isTitle,
        text: text,
        titleSize: 28,
        titleColor: AppColor.navyColor,
      ),
    );
  }
}
