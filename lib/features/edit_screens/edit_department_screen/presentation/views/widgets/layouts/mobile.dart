
import 'package:flutter/cupertino.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../edit_company_drop_menu.dart';
import '../edit_text_form/edit_end_in.dart';
import '../edit_text_form/edit_extra_day_for_com.dart';
import '../edit_text_form/edit_extra_day_for_emp.dart';
import '../edit_text_form/edit_extra_hour_for_com.dart';
import '../edit_text_form/edit_extra_hour_for_emp.dart';
import '../edit_text_form/edit_incentive.dart';
import '../edit_text_form/edit_salary_for_com.dart';
import '../edit_text_form/edit_salary_for_emp.dart';
import '../edit_text_form/edit_start_in.dart';


class EditDepartmentMobileLayout extends StatelessWidget {
  const EditDepartmentMobileLayout({
    super.key,
    required this.salary,
    required String wanted,
    required this.incetive,
    required this.company,
    required this.companyStartIn,
    required this.companyEndIn,
    required this.salaryForCompany,
    required this.extraDayForCompany,
    required this.extraDayForEmp,
    required this.extraHourForCompany,
    required this.extraNighShiftHourForCompany,
    required this.extraHourForEmp,
    required this.extraNightShiftHourForEmp,
  }) : _wanted = wanted;

  final TextEditingController salary;
  final String _wanted;
  final TextEditingController incetive;
  final String company;
  final TextEditingController companyStartIn;
  final TextEditingController companyEndIn;
  final TextEditingController salaryForCompany;
  final TextEditingController extraDayForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForCompany;
  final TextEditingController extraNighShiftHourForCompany;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNightShiftHourForEmp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EditSalary(salary: salary, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditIncentive(incetive: incetive, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditCompaniesDropMenu(company: company),
        const SizedBox(
          height: 10,
        ),
        EditStartIn(companyStartIn: companyStartIn, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditEndIn(companyEndIn: companyEndIn, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditSalaryCompForEmp(
            salaryForCompany: salaryForCompany, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditExtraDayForCompany(
            extraDayForCompany: extraDayForCompany, wanted: _wanted),
        const SizedBox(
          height: 10,
        ),
        EditExtraDayForEmp(extraDayForEmp: extraDayForEmp, wanted: _wanted),
        const SizedBox(
          height: 5,
        ),
        const TitleText(
          text: "الساعة الإضافية للمقاول",
          isTitle: false,
        ),
        const SizedBox(
          height: 5,
        ),
        EditExtraHourForCompany(
            extraHourForCompany: extraHourForCompany,
            wanted: _wanted,
            extraNighShiftHourForCompany: extraNighShiftHourForCompany),
        const SizedBox(
          height: 5,
        ),
        const TitleText(
          text: "الساعة الإضافية للعامل",
          isTitle: false,
        ),
        const SizedBox(
          height: 5,
        ),
        EditExtraHourForEmp(
            extraHourForEmp: extraHourForEmp,
            wanted: _wanted,
            extraNightShiftHourForEmp: extraNightShiftHourForEmp)
      ],
    );
  }
}
