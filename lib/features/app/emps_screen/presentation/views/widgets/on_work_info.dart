import 'package:flutter/material.dart';

import 'bottom_sheet_emp_data/bottom_sheet_extra_day.dart';
import 'bottom_sheet_emp_data/bottom_sheet_extra_day_shift_hours.dart';
import 'bottom_sheet_emp_data/bottom_sheet_extra_night_shift_hours.dart';
import 'bottom_sheet_emp_data/bottom_sheet_incective_and_salary.dart';
import 'bottom_sheet_emp_data/bttom_bank_acc.dart';
import 'emp_details_screen.dart';

class OnWorkInfo extends StatelessWidget {
  const OnWorkInfo({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BottomSheetEMPSalaryAndIncentive(widget: widget),
        const SizedBox(height: 15),
        BottomSheetEMPExtraDay(widget: widget),
        SizedBox(height: widget.departmentsModel.extraDayForEmp! == 0 ? 0 : 15),
        BottomSheetEMPDayExtraHoure(widget: widget),
        const SizedBox(height: 15),
        BottomSheetEMPNightShiftExtraHour(widget: widget),
        SizedBox(
            height: widget.departmentsModel.extraNightShiftHourForEmp! == 0
                ? 0
                : 15),
        BottomSheetEMPBankAcc(widget: widget),
        SizedBox(height: widget.departmentsModel.extraDayForEmp! == 0 ? 0 : 15),
      ],
    );
  }
}
