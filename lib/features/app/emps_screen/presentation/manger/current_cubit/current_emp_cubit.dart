import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/emoloyees_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'current_emp_state.dart';

class CurrentEmpCubit extends Cubit<CurrentEmpState> {
  CurrentEmpCubit() : super(CurrentEmpInitial());

  static CurrentEmpCubit get(context) => BlocProvider.of(context);

  final FirebaseService _service = FirebaseService();

  Future<void> fetchEmpCompanies({required String departmentId}) async {
    emit(Loading());
    try {
      List<EmployeesModel> empList = await _getEmpList(departmentId);
      emit(SuccessSubCollection(empList));
    } catch (e) {
      emit(FailedSubCollection(e.toString()));
    }
  }

  Future<List<EmployeesModel>> _getEmpList(String departmentId) async {
    List<EmployeesModel> empList = [];

    QuerySnapshot? data = await _service.getSubCollectionData(
      departmentCollection: FBFirestoreName.departmentCollection,
      departmentId: departmentId,
      subCollection: FBFirestoreName.empSubCollection,
      jobStatus: FBFirestoreName.empJobStatusOnWork,
    );

    if (data != null && data.docs.isNotEmpty) {
      for (var employeeDoc in data.docs) {
        EmployeesModel data = EmployeesModel.fromDocumentSnapshot(employeeDoc);
        empList.sort((a, b) => a.empId!.compareTo(b.empId!));

        empList.add(data);
      }
    }
    return empList;
  }

  DateTime now = DateTime.now();

  Future<void> createReward({
    required List<EmployeesModel> employees,
    required dynamic salary,
    required dynamic incentive,
    required double many,
    required String departmentName,
  }) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName("A1").setText("م");
    sheet.getRangeByName("B1").setText("رقم القيد");
    sheet.getRangeByName("C1").setText("اسم العامل");
    sheet.getRangeByName("D1").setText("التخصص");
    sheet.getRangeByName("E1").setText("الرقم القومي");
    sheet.getRangeByName("F1").setText("رقم الحساب البنكي");
    sheet.getRangeByName("G1").setText("المكافاءة");

    // Populate data
    for (int i = 0; i < employees.length; i++) {
      sheet.getRangeByName("A${i + 2}").setText((i + 1).toString());
      sheet.getRangeByName("B${i + 2}").setText(employees[i].empId!);
      sheet.getRangeByName("C${i + 2}").setText(employees[i].empName!);
      sheet.getRangeByName("D${i + 2}").setText(employees[i].scoop!);
      sheet.getRangeByName("E${i + 2}").setText(employees[i].empNId!);
      sheet.getRangeByName("F${i + 2}").setText(employees[i].empBankAcc!);
      sheet
          .getRangeByName("G${i + 2}")
          .setText("${(many * (salary + incentive)).round()}");
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute("download",
            'مكافاءة عمالة $departmentName-${now.month}-${now.year}.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = Platform.isWindows
          ? "$path\\مكافاءة عمالة $departmentName-${now.month}-${now.year}.xlsx"
          : "$path/مكافاءة عمالة $departmentName-${now.month}-${now.year}.xlsx";
      final File file = File(fileName);

      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }

  Future<void> printEmp({
    required List<EmployeesModel> employees,
    required dynamic salary,
    required dynamic incentive,
    required String departmentName,
  }) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName("A1").setText("م");
    sheet.getRangeByName("B1").setText("رقم القيد");
    sheet.getRangeByName("C1").setText("اسم العامل");
    sheet.getRangeByName("D1").setText("التخصص");
    sheet.getRangeByName("E1").setText("الرقم القومي");
    sheet.getRangeByName("F1").setText("رقم الحساب البنكي");
    sheet.getRangeByName("G1").setText("القسم");
    sheet.getRangeByName("H1").setText("بداية العمل");
    sheet.getRangeByName("I1").setText("رقم الهاتف");
    sheet.getRangeByName("J1").setText("العنوان");
    sheet.getRangeByName("K1").setText("حالة العمل");

    // Populate data
    for (int i = 0; i < employees.length; i++) {
      sheet.getRangeByName("A${i + 2}").setText((i + 1).toString());
      sheet.getRangeByName("B${i + 2}").setText(employees[i].empId!);
      sheet.getRangeByName("C${i + 2}").setText(employees[i].empName!);
      sheet.getRangeByName("D${i + 2}").setText(employees[i].scoop!);
      sheet.getRangeByName("E${i + 2}").setText(employees[i].empNId!);
      sheet.getRangeByName("F${i + 2}").setText(employees[i].empBankAcc!);
      sheet.getRangeByName("G${i + 2}").setText(employees[i].empDepartment);
      sheet.getRangeByName("H${i + 2}").setText(employees[i].startJob);
      sheet.getRangeByName("I${i + 2}").setText(employees[i].empPhoneNumber);
      sheet.getRangeByName("J${i + 2}").setText(employees[i].empAddress);
      sheet.getRangeByName("K${i + 2}").setText(
          employees[i].jobStatus == FBFirestoreName.empJobStatusOnWork
              ? "على قوة العمل"
              : "انهاء عمل");
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute("download", 'بيانات عمالة $departmentName.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = Platform.isWindows
          ? "$path\\بيانات عمالة $departmentName.xlsx"
          : "$path/بيانات عمالة $departmentName.xlsx";
      final File file = File(fileName);

      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
}
