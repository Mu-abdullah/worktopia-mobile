import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'resigned_emp_state.dart';

class ResignedEmpCubit extends Cubit<ResignedEmpState> {
  ResignedEmpCubit() : super(ResignedEmpInitial());
  static ResignedEmpCubit get(context) => BlocProvider.of(context);

  final FirebaseService _service = FirebaseService();

  Future<void> fetchEmpCompanies({required String departmentId}) async {
    emit(Loading());
    try {
      List<EmployeesModel> empList = await _getEmpList(departmentId);
      empList.sort((a, b) => a.empId!.compareTo(b.empId!));

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
      jobStatus: FBFirestoreName.empJobStatusResigned,
    );

    if (data != null && data.docs.isNotEmpty) {
      for (var employeeDoc in data.docs) {
        EmployeesModel data = EmployeesModel.fromDocumentSnapshot(employeeDoc);
        empList.add(data);
      }
    }
    return empList;
  }
}
