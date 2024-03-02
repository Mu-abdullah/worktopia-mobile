import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'edit_department_state.dart';

class EditDepartmentCubit extends Cubit<EditDepartmentState> {
  EditDepartmentCubit() : super(EditDepartmentInitial());

  static EditDepartmentCubit get(context) => BlocProvider.of(context);

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

  Future<void> updateDepartment(
      {required DepartmentsModel data, required String docID}) async {
    emit(LoadingUpdateDepartment());
    try {
      await FirebaseService().updateDepartment(
          departmentData: data, docId: docID); // Define FirebaseService class
      emit(SuccessUpdateDepartment());
    } catch (e) {
      emit(FaieldUpdateDepartment(e.toString()));
    }
  }
}
