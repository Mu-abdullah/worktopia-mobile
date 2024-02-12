import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPScoop extends StatelessWidget {
  const BottomSheetEMPScoop({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "التخصص: ${widget.model.scoop!}",
      subTitleColor: AppColor.blackColor.withOpacity(.7),
    );
  }
}
