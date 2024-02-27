import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:worktopia/core/entites/department_model.dart';

import '../../../../core/entites/emoloyees_model.dart';
import '../../../../core/helper/firebase_names.dart';
import 'all_emp_state.dart';

class AllEmpCubit extends Cubit<AllEmpState> {
  AllEmpCubit() : super(AllEmpInitialState());

  Future<void> getDepartmentDocuments(List<String> departmentIds) async {
    try {
      List<EmployeesModel> allEmployees = [];
      // List<DepartmentsModel> departments = [];

      for (String departmentId in departmentIds) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(FBFirestoreName.departmentCollection)
            .doc(departmentId)
            .collection(FBFirestoreName.empSubCollection)
            .where("jobStatus", isEqualTo: FBFirestoreName.empJobStatusOnWork)
            .get();

        List<EmployeesModel> employees = querySnapshot.docs.map((doc) {
          return EmployeesModel.fromDocumentSnapshot(doc);
        }).toList();

        // try {
        //   QuerySnapshot departmentsQuerySnapshot = await FirebaseFirestore
        //       .instance
        //       .collection(FBFirestoreName.companyCollection)
        //       .get();

        //   List<DepartmentsModel> department = departmentsQuerySnapshot.docs
        //       .map((doc) => DepartmentsModel.fromDocumentSnapshot(doc))
        //       .toList();
        //   departments.addAll(department);
        //   emit(SuccessAllEmpState(department: departments));
        // } catch (e) {
        //   emit(FailedAllEmpState(e.toString()));
        // }

        employees.sort((a, b) => a.empId!.compareTo(b.empId!));

        allEmployees.addAll(employees);
      }

      emit(SuccessAllEmpState(emps: allEmployees));
    } catch (e) {
      emit(FailedAllEmpState(e.toString()));
    }
  }

  Future<void> createExcel({
    required List<EmployeesModel> employees,
    // required List<DepartmentsModel> department,
  }) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName("A1").setText("اسم العامل");
    sheet.getRangeByName("B1").setText("رقم القيد");
    sheet.getRangeByName("C1").setText("التخصص");
    sheet.getRangeByName("D1").setText("الرقم القومي");
    sheet.getRangeByName("E1").setText("رقم الحساب البنكي");

    // Populate data
    for (int i = 0; i < employees.length; i++) {
      sheet.getRangeByName("A${i + 2}").setText(employees[i].empId!);
      sheet.getRangeByName("B${i + 2}").setText(employees[i].empName!);
      sheet.getRangeByName("C${i + 2}").setText(employees[i].scoop!);
      sheet.getRangeByName("D${i + 2}").setText(employees[i].empNId!);
      sheet.getRangeByName("E${i + 2}").setText(employees[i].empBankAcc!);
      // sheet.getRangeByName("F${i + 2}").setText(department[i].empSalary!);
      // Add other data fields as needed
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute("download", 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? "$path\\Output.xlsx" : "$path/Outout.xlsx";
      final File file = File(fileName);

      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
  // Future<void> createExcel() async {
  //   final Workbook workbook = Workbook();
  //   final Worksheet sheet = workbook.worksheets[0];
  //   sheet.getRangeByName("A1").setText("text");
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //   if (kIsWeb) {
  //     AnchorElement(
  //         href:
  //             'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
  //       ..setAttribute("download", 'Output.xlsx')
  //       ..click();
  //   } else {
  //     final String path = (await getApplicationSupportDirectory()).path;
  //     final String fileName =
  //         Platform.isWindows ? "$path\\Output.xlsx" : "$path/Outout.xlsx";
  //     final File file = File(fileName);

  //     await file.writeAsBytes(bytes, flush: true);
  //     OpenFile.open(fileName);
  //   }
  // }
}
