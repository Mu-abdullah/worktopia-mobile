import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPExtraDay extends StatelessWidget {
  const BottomSheetEMPExtraDay({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.departmentsModel.extraDayForEmp! == 0
          ? null
          : TitleText(
              text: haveExtraDay(),
              subTitleColor: AppColor.blackColor.withOpacity(.7),
              isTitle: false,
              maxLine: 2,
            ),
    );
  }

  String haveExtraDay() {
    if (widget.departmentsModel.extraDayForEmp! == 0) {
      return "اليوم الاضافي: عقد عملية لا يوجد مقابل لليوم الاضافي";
    } else {
      return "اجر اليوم الاضافي: ${widget.departmentsModel.extraDayForEmp!.round()} جنيه";
    }
  }
}
