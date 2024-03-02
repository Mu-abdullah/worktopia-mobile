import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetStartJob extends StatelessWidget {
  const BottomSheetStartJob({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "بداية العمل: ${widget.model.startJob}",
      subTitleColor: AppColor.blackColor,
    );
  }
}
