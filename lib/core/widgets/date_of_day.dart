import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';
import 'default_texts.dart';

class DateOfDay extends StatelessWidget {
  const DateOfDay({
    super.key,
    this.withOpacity = true,
    this.color = AppColor.blackColor,
  });
  final bool withOpacity;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: TitleText(
        text: DateFormat.yMMMMEEEEd().format(
          DateTime.now(),
        ),
        subTitleColor: color.withOpacity(withOpacity ? .7 : 1),
        isTitle: false,
      ),
    );
  }
}
