import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPName extends StatelessWidget {
  const BottomSheetEMPName({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      text: widget.model.empName!,
      maxLine: 2,
      titleSize: 29,
    );
  }
}
