
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/fire_base_services.dart';
import 'department_data_state.dart';

class DepartmentDataCubit extends Cubit<DepartmentDataState> {
  DepartmentDataCubit() : super(DepartmentDataInitial());
  static DepartmentDataCubit get(context) => BlocProvider.of(context);

  final FirebaseService _service = FirebaseService();

  String? scoop;

  Future<void> fetchDepartmentData({required String docId}) async {
    emit(Loading());
    try {
      await _service.getDepartmentData(docId: docId);

      emit(SuccessDepartmentData());
    } catch (e) {
      emit(FaieldDepartmentData(e.toString()));
    }
  }

  Future<int> getEmpCount({
    required String departmentId,
    required String departmentCollection,
    required String subCollection,
  }) async {
    var count = _service.getSubcollectionLength(
      departmentId: departmentId,
      departmentCollection: departmentCollection,
      subCollection: subCollection,
    );
    return count;
  }
}
