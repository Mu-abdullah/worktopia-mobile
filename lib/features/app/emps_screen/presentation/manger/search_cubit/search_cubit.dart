import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:worktopia/core/entities/emoloyees_model.dart';

import '../../../../../../core/helper/firebase_names.dart';

class SearchEmpCubit extends Cubit<List<EmployeesModel>> {
  SearchEmpCubit() : super([]);

  Future<void> search({
    required String colllectinID,
    String? empId,
    String? empName,
    String? empPhoneNumber,
  }) async {
    try {
      Query query = FirebaseFirestore.instance
          .collection(FBFirestoreName.departmentCollection)
          .doc(colllectinID)
          .collection(FBFirestoreName.empSubCollection);

      if (empName != null) {
        query = query.where("empName", isGreaterThanOrEqualTo: empName);
      }
      if (empId != null) {
        query = query.where("empId", isGreaterThanOrEqualTo: empId);
      }

      if (empPhoneNumber != null) {
        query = query.where("empPhoneNumber",
            isGreaterThanOrEqualTo: empPhoneNumber);
      }

      var snapshot = await query.get();
      var documents = snapshot.docs
          .map((doc) => EmployeesModel.fromDocumentSnapshot(doc))
          .toList();
      emit(documents);
    } catch (e) {
      emit([]);
    }
  }
}
