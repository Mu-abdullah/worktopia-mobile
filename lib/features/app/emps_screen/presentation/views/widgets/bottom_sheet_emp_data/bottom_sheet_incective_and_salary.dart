import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
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
          text: haveSalary(),
          subTitleColor: AppColor.blackColor.withOpacity(.7),
        ),
        const SizedBox(height: 15),
        TitleText(
          isTitle: false,
          text:
              "المنحة الشهرية: ${(widget.departmentsModel.empsIncentive!).toDouble()} جنيه",
          subTitleColor: AppColor.blackColor.withOpacity(.7),
        ),
      ],
    );
  }

  String haveSalary() {
    if (widget.departmentsModel.empSalary! == (0).toDouble()) {
      return "الراتب الشهري: عقد عملية، يتحمل المقاول راتبه";
    } else {
      return "الراتب الشهري: ${(widget.departmentsModel.empSalary!).toDouble()} جنيه";
    }
  }
}
