import 'package:flutter/material.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../manger/department_cubit/department_cubit.dart';

class CreateDepartmentButton extends StatelessWidget {
  const CreateDepartmentButton({
    super.key,
    required this.formKey,
    required this.salary,
    required this.incetive,
    required this.cubit,
    required this.companyStartIn,
    required this.companyEndIn,
    required this.extraDayForCompany,
    required this.extraDayForEmp,
    required this.extraHourForCompany,
    required this.extraHourForEmp,
    required this.extraNighShiftHourForCompany,
    required this.extraNightShiftHourForEmp,
    required this.companySalaryForEmp,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController salary;
  final TextEditingController companySalaryForEmp;
  final TextEditingController incetive;
  final DepartmentCubit cubit;
  final TextEditingController companyStartIn;
  final TextEditingController companyEndIn;
  final TextEditingController extraDayForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForCompany;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNighShiftHourForCompany;
  final TextEditingController extraNightShiftHourForEmp;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPress: () {
          if (formKey.currentState!.validate()) {
            var data = DepartmentsModel(
              departmentId: cubit.departmentId(),
              departmentName: cubit.departmentName,
              empSalary: double.parse(salary.text),
              empsIncentive: double.parse(incetive.text),
              departmentCompanyForNow: cubit.companyValue,
              departmentCompanyStartIn: companyStartIn.text,
              departmentCompanyEndIn: companyEndIn.text,
              extraDayForCompany: double.parse(extraDayForCompany.text),
              extraDayForEmp: double.parse(extraDayForEmp.text),
              extraHourForCompany: double.parse(extraHourForCompany.text),
              extraHourForEmp: double.parse(extraHourForEmp.text),
              extraNightShiftHourForCompany:
                  double.parse(extraNighShiftHourForCompany.text),
              extraNightShiftHourForEmp:
                  double.parse(extraNightShiftHourForEmp.text),
              companySalaryFroEmp: double.parse(
                companySalaryForEmp.text,
              ),
            );
            cubit.sendDataToFirestore(data, cubit.departmentId());
          }
        },
        buttonName: "تسجيل القسم");
  }
}
