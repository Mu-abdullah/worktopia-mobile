import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentsModel {
  final String? departmentId;
  final String? departmentName;
  final dynamic companySalaryFroEmp;
  final dynamic empSalary;
  final dynamic empsIncentive;
  final String? departmentCompanyForNow;
  final String? departmentCompanyStartIn;
  final String? departmentCompanyEndIn;
  final dynamic extraDayForCompany;
  final dynamic extraDayForEmp;
  final dynamic extraHourForCompany;
  final dynamic extraHourForEmp;
  final dynamic extraNightShiftHourForCompany;
  final dynamic extraNightShiftHourForEmp;


  DepartmentsModel({
    this.departmentId,
    this.departmentName,
    this.departmentCompanyForNow,
    this.departmentCompanyStartIn,
    this.departmentCompanyEndIn,
    this.empSalary,
    this.companySalaryFroEmp,
    this.empsIncentive,
    this.extraDayForCompany,
    this.extraDayForEmp,
    this.extraHourForCompany,
    this.extraNightShiftHourForCompany,
    this.extraNightShiftHourForEmp,
    this.extraHourForEmp,

  });

  factory DepartmentsModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? json = snapshot.data() as Map<String, dynamic>?;
    return DepartmentsModel(
      departmentId: json?["departmentId"],
      departmentName: json?["departmentName"],
      departmentCompanyForNow: json?["departmentCompanyForNow"],
      departmentCompanyStartIn: json?["departmentCompanyStartIn"],
      departmentCompanyEndIn: json?["departmentCompanyEndIn"],
      empSalary: json?["empSalary"],
      companySalaryFroEmp: json?["companySalaryFroEmp"],
      empsIncentive: json?["empsIncentive"],
      extraDayForCompany: json?["extraDayForCompany"],
      extraDayForEmp: json?["extraDayForEmp"],
      extraHourForCompany: json?["extraHourForCompany"],
      extraHourForEmp: json?["extraHourForEmp"],
      extraNightShiftHourForEmp: json?["extraNightShiftHourForEmp"],
      extraNightShiftHourForCompany: json?["extraNightShiftHourForCompany"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "departmentId": departmentId,
      "departmentName": departmentName,
      "departmentCompanyForNow": departmentCompanyForNow,
      "departmentCompanyStartIn": departmentCompanyStartIn,
      "departmentCompanyEndIn": departmentCompanyEndIn,
      "empSalary": empSalary,
      "companySalaryFroEmp": companySalaryFroEmp,
      "empsIncentive": empsIncentive,
      "extraDayForCompany": extraDayForCompany,
      "extraDayForEmp": extraDayForEmp,
      "extraNightShiftHourForEmp": extraNightShiftHourForEmp,
      "extraNightShiftHourForCompany": extraNightShiftHourForCompany,
      "extraHourForCompany": extraHourForCompany,
      "extraHourForEmp": extraHourForEmp,

    };
  }
}
