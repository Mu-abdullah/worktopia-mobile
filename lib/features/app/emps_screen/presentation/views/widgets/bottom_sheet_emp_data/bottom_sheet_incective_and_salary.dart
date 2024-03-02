import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPSalaryAndIncentive extends StatelessWidget {
  const BottomSheetEMPSalaryAndIncentive({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleText(
          isTitle: false,
          text:
              "الراتب الشهري: ${(widget.departmentsModel.empSalary!).toDouble()} جنيه",
        ),
        const SizedBox(height: 15),
        TitleText(
          isTitle: false,
          text:
              "المنحة الشهرية: ${(widget.departmentsModel.empsIncentive!).toDouble()} جنيه",
        ),
      ],
    );
  }
}
