import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/functions.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPStatus extends StatelessWidget {
  const BottomSheetEMPStatus({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "حالة العمل: ${jobStatus(model: widget.model.jobStatus!)}",
      subTitleColor: AppColor.blackColor,
    );
  }
}
