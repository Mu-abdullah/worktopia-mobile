import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktopia/core/entites/emoloyees_model.dart';
import 'package:worktopia/core/helper/firebase_names.dart';
import 'package:worktopia/features/app/all_emp/cubit/all_emp_state.dart';

class AllEmpCubit extends Cubit<AllEmpState> {
  AllEmpCubit() : super(AllEmpInitialState());

  Future<void> getDepartmentDocuments(List<String> departmentIds) async {
    try {
      List<EmployeesModel> allEmployees = [];
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
        employees.sort((a, b) => a.empId!.compareTo(b.empId!));
        allEmployees.addAll(employees);
      }
      emit(SuccessAllEmpState(allEmployees));
    } catch (e) {
      emit(FailedAllEmpState(e.toString()));
    }
  }
}
