import 'package:flutter/material.dart';

import '../../../../../../core/entities/department_model.dart';
import 'edit_feilds.dart';
import 'update_department_button.dart';

class EditDepartmentBody extends StatefulWidget {
  const EditDepartmentBody({
    super.key,
    required this.model,
  });
  final DepartmentsModel model;
  @override
  State<EditDepartmentBody> createState() => _EditDepartmentBodyState();
}

class _EditDepartmentBodyState extends State<EditDepartmentBody> {
  final salary = TextEditingController();
  final salaryForCompany = TextEditingController();
  final incetive = TextEditingController();
  final extraDayForCompany = TextEditingController();
  final extraHourForCompany = TextEditingController();
  final extraDayForEmp = TextEditingController();
  final extraHourForEmp = TextEditingController();
  final companyStartIn = TextEditingController();
  final companyEndIn = TextEditingController();
  final extraNighShiftHourForCompany = TextEditingController();
  final extraNightShiftHourForEmp = TextEditingController();
  late final String company;
  late final String depatrmentID;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    salary.text = widget.model.empSalary!.toString();
    salaryForCompany.text = widget.model.companySalaryFroEmp!.toString();
    incetive.text = widget.model.empsIncentive!.toString();
    extraDayForCompany.text = widget.model.extraDayForCompany.toString();
    extraHourForCompany.text = widget.model.extraHourForCompany.toString();
    extraDayForEmp.text = widget.model.extraDayForEmp.toString();
    extraHourForEmp.text = widget.model.extraHourForEmp.toString();
    companyStartIn.text = widget.model.departmentCompanyStartIn.toString();
    companyEndIn.text = widget.model.departmentCompanyEndIn.toString();
    extraNighShiftHourForCompany.text =
        widget.model.extraNightShiftHourForCompany.toString();
    extraNightShiftHourForEmp.text =
        widget.model.extraNightShiftHourForEmp.toString();
    company = widget.model.departmentCompanyForNow!;
    depatrmentID = widget.model.departmentId!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EditDepartmentsFeilds(
            formKey: formKey,
            extraHourForCompany: extraHourForCompany,
            wanted: _wanted,
            extraNighShiftHourForCompany: extraNighShiftHourForCompany,
            companyEndIn: companyEndIn,
            extraDayForCompany: extraDayForCompany,
            companyStartIn: companyStartIn,
            incetive: incetive,
            salary: salary,
            salaryForCompany: salaryForCompany,
            extraDayForEmp: extraDayForEmp,
            extraHourForEmp: extraHourForEmp,
            extraNightShiftHourForEmp: extraNightShiftHourForEmp,
            company: company,
          ),
          UpdateDepartmentButton(
            formKey: formKey,
            salary: salary,
            incetive: incetive,
            companyStartIn: companyStartIn,
            companyEndIn: companyEndIn,
            extraDayForCompany: extraDayForCompany,
            extraDayForEmp: extraDayForEmp,
            extraHourForCompany: extraHourForCompany,
            extraHourForEmp: extraHourForEmp,
            extraNighShiftHourForCompany: extraNighShiftHourForCompany,
            extraNightShiftHourForEmp: extraNightShiftHourForEmp,
            widget: widget,
            salaryForCompany: salaryForCompany,
          ),
        ],
      ),
    );
  }

  String get _wanted => "مطلوب";
}
