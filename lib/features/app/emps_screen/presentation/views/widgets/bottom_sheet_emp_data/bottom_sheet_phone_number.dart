import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPPhoneNumber extends StatelessWidget {
  const BottomSheetEMPPhoneNumber({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      text: "رقم الهاتف: ${widget.model.empPhoneNumber!}",
      subTitleColor: AppColor.blackColor.withOpacity(.7),
      isTitle: false,
    );
  }
}
