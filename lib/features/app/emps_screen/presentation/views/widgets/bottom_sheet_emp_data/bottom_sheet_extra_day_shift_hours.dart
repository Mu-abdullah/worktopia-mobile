import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPDayExtraHoure extends StatelessWidget {
  const BottomSheetEMPDayExtraHoure({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.departmentsModel.extraHourForEmp! == 0
          ? null
          : TitleText(
              isTitle: false,
              text:
                  "اجر الساعة الاضافية  ${widget.departmentsModel.extraHourForEmp!.toString()} جنيه",
           
            ),
    );
  }
}
