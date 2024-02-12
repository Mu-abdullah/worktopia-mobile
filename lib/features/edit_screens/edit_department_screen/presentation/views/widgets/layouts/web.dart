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

class EditDepartmentWebLayout extends StatelessWidget {
  const EditDepartmentWebLayout({
    super.key,
    required this.salary,
    required String wanted,
    required this.salaryForCompany,
    required this.incetive,
    required this.companyStartIn,
    required this.companyEndIn,
    required this.company,
    required this.extraDayForCompany,
    required this.extraDayForEmp,
    required this.extraHourForEmp,
    required this.extraNightShiftHourForEmp,
    required this.extraHourForCompany,
    required this.extraNighShiftHourForCompany,
  }) : _wanted = wanted;

  final TextEditingController salary;
  final String _wanted;
  final TextEditingController salaryForCompany;
  final TextEditingController incetive;
  final TextEditingController companyStartIn;
  final TextEditingController companyEndIn;
  final String company;
  final TextEditingController extraDayForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNightShiftHourForEmp;
  final TextEditingController extraHourForCompany;
  final TextEditingController extraNighShiftHourForCompany;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: EditSalary(salary: salary, wanted: _wanted),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EditSalaryCompForEmp(
                  salaryForCompany: salaryForCompany, wanted: _wanted),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EditIncentive(incetive: incetive, wanted: _wanted),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child:
                  EditStartIn(companyStartIn: companyStartIn, wanted: _wanted),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EditEndIn(companyEndIn: companyEndIn, wanted: _wanted),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EditCompaniesDropMenu(company: company),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: EditExtraDayForCompany(
                  extraDayForCompany: extraDayForCompany, wanted: _wanted),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: EditExtraDayForEmp(
                  extraDayForEmp: extraDayForEmp, wanted: _wanted),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(text: "الساعة النهارية للعامل"),
                  const SizedBox(
                    height: 5,
                  ),
                  EditExtraHourForEmp(
                      extraHourForEmp: extraHourForEmp,
                      wanted: _wanted,
                      extraNightShiftHourForEmp: extraNightShiftHourForEmp),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TitleText(text: "الساعة النهارية للمقاول"),
                  const SizedBox(
                    height: 5,
                  ),
                  EditExtraHourForCompany(
                      extraHourForCompany: extraHourForCompany,
                      wanted: _wanted,
                      extraNighShiftHourForCompany:
                          extraNighShiftHourForCompany),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
