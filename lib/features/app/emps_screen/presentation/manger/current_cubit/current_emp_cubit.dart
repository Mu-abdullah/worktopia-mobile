import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entites/emoloyees_model.dart';
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
      List<EmpsModels> empList = await _getEmpList(departmentId);
      emit(SuccessSubCollection(empList));
    } catch (e) {
      emit(FailedSubCollection(e.toString()));
    }
  }

  Future<List<EmpsModels>> _getEmpList(String departmentId) async {
    List<EmpsModels> empList = [];

    QuerySnapshot? data = await _service.getSubCollectionData(
      departmentCollection: FBFirestoreName.departmentCollection,
      departmentId: departmentId,
      subCollection: FBFirestoreName.empCollection,
      jobStatus: FBFirestoreName.empJobStatusOnWork,
    );

    if (data != null && data.docs.isNotEmpty) {
      for (var employeeDoc in data.docs) {
        EmpsModels data = EmpsModels.fromDocumentSnapshot(employeeDoc);
        empList.sort((a, b) => a.empId!.compareTo(b.empId!));

        empList.add(data);
      }
    }
    return empList;
  }
}
