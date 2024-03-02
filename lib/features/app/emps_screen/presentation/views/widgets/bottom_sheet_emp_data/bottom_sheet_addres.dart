import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPAddress extends StatelessWidget {
  const BottomSheetEMPAddress({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "العنوان: ${widget.model.empAddress}",
   
      maxLine: 2,
    );
  }
}
