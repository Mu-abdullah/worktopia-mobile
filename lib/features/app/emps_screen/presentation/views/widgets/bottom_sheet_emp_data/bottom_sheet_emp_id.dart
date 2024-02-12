import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPID extends StatelessWidget {
  const BottomSheetEMPID({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "رقم القيد: ${widget.model.empId!}",
      subTitleColor: AppColor.blackColor.withOpacity(.7),
    );
  }
}
