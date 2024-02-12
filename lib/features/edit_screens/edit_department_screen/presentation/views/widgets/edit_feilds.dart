import 'package:flutter/material.dart';

import '../../../../../../core/utils/constant.dart';
import 'layouts/mobile.dart';
import 'layouts/tablet.dart';
import 'layouts/web.dart';

class EditDepartmentsFeilds extends StatelessWidget {
  const EditDepartmentsFeilds({
    super.key,
    required this.formKey,
    required this.extraHourForCompany,
    required String wanted,
    required this.extraNighShiftHourForCompany,
    required this.companyEndIn,
    required this.extraDayForCompany,
    required this.companyStartIn,
    required this.incetive,
    required this.salary,
    required this.salaryForCompany,
    required this.extraDayForEmp,
    required this.extraHourForEmp,
    required this.extraNightShiftHourForEmp,
    required this.company,
  }) : _wanted = wanted;

  final GlobalKey<FormState> formKey;
  final TextEditingController extraHourForCompany;
  final String _wanted;
  final TextEditingController extraNighShiftHourForCompany;
  final TextEditingController companyEndIn;
  final TextEditingController extraDayForCompany;
  final TextEditingController companyStartIn;
  final TextEditingController incetive;
  final TextEditingController salary;
  final TextEditingController salaryForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNightShiftHourForEmp;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= Constant.mobileWidth) {
              return EditDepartmentMobileLayout(
                salary: salary,
                wanted: _wanted,
                incetive: incetive,
                company: company,
                companyStartIn: companyStartIn,
                companyEndIn: companyEndIn,
                salaryForCompany: salaryForCompany,
                extraDayForCompany: extraDayForCompany,
                extraDayForEmp: extraDayForEmp,
                extraHourForCompany: extraHourForCompany,
                extraNighShiftHourForCompany: extraNighShiftHourForCompany,
                extraHourForEmp: extraHourForEmp,
                extraNightShiftHourForEmp: extraNightShiftHourForEmp,
              );
            } else if (constraints.maxWidth <= Constant.tabletWidth) {
              return EditDepartmentTabletLayout(
                  salary: salary,
                  wanted: _wanted,
                  salaryForCompany: salaryForCompany,
                  companyStartIn: companyStartIn,
                  companyEndIn: companyEndIn,
                  extraDayForCompany: extraDayForCompany,
                  extraDayForEmp: extraDayForEmp,
                  extraHourForEmp: extraHourForEmp,
                  extraNightShiftHourForEmp: extraNightShiftHourForEmp,
                  extraHourForCompany: extraHourForCompany,
                  extraNighShiftHourForCompany: extraNighShiftHourForCompany,
                  incetive: incetive,
                  company: company);
            } else {
              return EditDepartmentWebLayout(
                  salary: salary,
                  wanted: _wanted,
                  salaryForCompany: salaryForCompany,
                  incetive: incetive,
                  companyStartIn: companyStartIn,
                  companyEndIn: companyEndIn,
                  company: company,
                  extraDayForCompany: extraDayForCompany,
                  extraDayForEmp: extraDayForEmp,
                  extraHourForEmp: extraHourForEmp,
                  extraNightShiftHourForEmp: extraNightShiftHourForEmp,
                  extraHourForCompany: extraHourForCompany,
                  extraNighShiftHourForCompany: extraNighShiftHourForCompany);
            }
          },
        ),
      ),
    );
  }
}
