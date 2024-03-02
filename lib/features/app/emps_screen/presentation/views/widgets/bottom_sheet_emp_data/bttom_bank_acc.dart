import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPBankAcc extends StatelessWidget {
  const BottomSheetEMPBankAcc({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "رقم الحساب البنكي: ${widget.model.empBankAcc}",
     
    );
  }
}
