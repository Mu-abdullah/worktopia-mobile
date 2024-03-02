import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPID extends StatelessWidget {
  const BottomSheetEMPID({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "رقم القيد: ${widget.model.empId!}",
    );
  }
}
