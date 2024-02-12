import 'package:flutter/material.dart';

import '../../../../../../core/widgets/default_texts.dart';
import 'companies_drop_menu.dart';
import 'text_field/comapny_extra_hour.dart';
import 'text_field/company_end_in.dart';
import 'text_field/company_extra_day.dart';
import 'text_field/company_salary_for_emp.dart';
import 'text_field/company_start_in.dart';
import 'text_field/department_incentive.dart';
import 'text_field/department_salary.dart';
import 'text_field/emp_extra_day.dart';
import 'text_field/emp_extra_hour.dart';

class DepartmentDetailsTextFormFeilds extends StatelessWidget {
  const DepartmentDetailsTextFormFeilds(
      {super.key,
     
      required String wanted,
      required this.incetive,
      required this.salary,
      required this.companySalaryForEmp,
      required this.extraDayForCompany,
      required this.extraDayForEmp,
      required this.extraHourForCompany,
      required this.extraHourForEmp,
      required this.companyStartIn,
      required this.companyEndIn,
      required this.extraNighShiftHourForCompany,
      required this.extraNightShiftHourForEmp})
      : _wanted = wanted;

  
  final String _wanted;
  final TextEditingController salary;
  final TextEditingController companySalaryForEmp;
  final TextEditingController incetive;
  final TextEditingController extraDayForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForCompany;
  final TextEditingController extraNighShiftHourForCompany;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNightShiftHourForEmp;
  final TextEditingController companyStartIn;
  final TextEditingController companyEndIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
       
        DepartmentSalary(
          salary: salary,
          wanted: _wanted,
        ),
        const SizedBox(
          height: 10,
        ),
        DepartmentIncentive(
          incetive: incetive,
          wanted: _wanted,
        ),
        const SizedBox(
          height: 10,
        ),
        const CompaniesDropMenu(),
        const SizedBox(
          height: 10,
        ),
        CompanyStartIn(
          startIn: companyStartIn,
          wanted: _wanted,
        ),
        const SizedBox(
          height: 10,
        ),
        CompanyEndtIn(
          endIn: companyEndIn,
          wanted: _wanted,
        ),
        const SizedBox(
          height: 10,
        ),
        CompanySalaryForEmp(companySalaryForEmp: companySalaryForEmp, wanted: _wanted,),
        const SizedBox(
          height: 10,
        ),
        DepartmentExtraDayForCompany(
          extraDayForCompany: extraDayForCompany,
          wanted: _wanted,
        ),
        const SizedBox(
          height: 10,
        ),
        DepartmentExtraDayFomEmp(
          extraDayForEmp: extraDayForEmp,
          wanted: _wanted,
        ),
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
        DepartmentExtraHourForCompany(
          extraHourForCompany: extraHourForCompany,
          wanted: _wanted,
          extraNighShiftHourForCompany: extraNighShiftHourForCompany,
        ),
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
        DepartmentExtraHourForEmp(
          extraHourForEmp: extraHourForEmp,
          wanted: _wanted,
          extraNightShiftHourForEmp: extraNightShiftHourForEmp,
        ),
      ],
    );
  }
}
