
import 'package:flutter/material.dart';

import 'bottom_sheet_emp_data/bottom_sheet_extra_day.dart';
import 'bottom_sheet_emp_data/bottom_sheet_extra_day_shift_hours.dart';
import 'bottom_sheet_emp_data/bottom_sheet_extra_night_shift_hours.dart';
import 'bottom_sheet_emp_data/bottom_sheet_incective_and_salary.dart';
import 'bottom_sheet_emp_data/bttom_bank_acc.dart';
import 'emp_bottom_sheet.dart';

class OnWorkInfo extends StatelessWidget {
  const OnWorkInfo({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BottomSheetEMPSalaryAndIncentive(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPExtraDay(widget: widget),
          SizedBox(
              height: widget.departmentsModel.extraDayForEmp! == 0
                  ? 0
                  : 5),
          BottomSheetEMPDayExtraHoure(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPNightShiftExtraHour(widget: widget),
          SizedBox(
              height: widget.departmentsModel
                          .extraNightShiftHourForEmp! ==
                      0
                  ? 0
                  : 5),
          BottomSheetEMPBankAcc(widget: widget),
        ],
      );
  }
}