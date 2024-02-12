import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPBankAcc extends StatelessWidget {
  const BottomSheetEMPBankAcc({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return TitleText(
      isTitle: false,
      text: "رقم الحساب البنكي: ${widget.model.empBankAcc}",
      subTitleColor: AppColor.blackColor.withOpacity(.7),
    );
  }
}