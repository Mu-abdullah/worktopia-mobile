import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPAddress extends StatelessWidget {
  const BottomSheetEMPAddress({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "العنوان: ${widget.model.empAddress}",
      subTitleColor: AppColor.blackColor.withOpacity(.7),
      maxLine: 2,
    );
  }
}
