import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPNightShiftExtraHour extends StatelessWidget {
  const BottomSheetEMPNightShiftExtraHour({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.departmentsModel.extraNightShiftHourForEmp! == 0
          ? null
          : TitleText(
              isTitle: false,
              text:
                  "الساعة الاضافية الليلية: ${widget.departmentsModel.extraNightShiftHourForEmp!.toString()} جنيه",
              subTitleColor: AppColor.blackColor.withOpacity(.7),
            ),
    );
  }
}
