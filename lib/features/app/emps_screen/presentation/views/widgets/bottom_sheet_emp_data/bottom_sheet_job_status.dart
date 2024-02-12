import 'package:flutter/material.dart';

import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPStatus extends StatelessWidget {
  const BottomSheetEMPStatus({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "حالة العمل: ${jobStatus()}",
      subTitleColor: AppColor.blackColor,
    );
  }

  String jobStatus() {
    if (widget.model.jobStatus! == FBFirestoreName.empJobStatusResigned) {
      return "استقالة";
    }
    if (widget.model.jobStatus! == FBFirestoreName.empJobStatusTermination) {
      return "استبعاد";
    } else {
      return "على قوة العمل";
    }
  }
}
