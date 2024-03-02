import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/tables_name.dart';
import 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());

  static DepartmentCubit get(context) => BlocProvider.of(context);

  String? companyValue;

  Future<void> getCompaniesNames() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FBFirestoreName.companyCollection)
          .get();

      List<String> companiesNames =
          querySnapshot.docs.map((doc) => doc.id).toList();

      emit(CompaniesLoaded(companiesNames: companiesNames));
    } catch (e) {
      emit(CompaniesError('Error fetching document names: $e'));
    }
  }

  void changeSelectedDocument(String? newValue) {
    companyValue = newValue;
    emit(CompaniesLoaded(
      companiesNames: (state as CompaniesLoaded).companiesNames,
      selectedCompany: newValue,
    ));
  }

  Future<void> sendDataToFirestore(DepartmentsModel data, String docID) async {
    emit(CreateDepartmentLoading());
    try {
      await FirebaseService().createDepartment(
          departmentData: data, docId: docID); // Define FirebaseService class
      emit(CreateDepartmentSuccess());
    } catch (e) {
      emit(CreateDepartmentFailure(e.toString()));
    }
  }

  String? departmentName;
  String departmentId() {
    if (departmentName == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    }
    if (departmentName == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    }
    if (departmentName == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    }
    if (departmentName == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
  }
}
