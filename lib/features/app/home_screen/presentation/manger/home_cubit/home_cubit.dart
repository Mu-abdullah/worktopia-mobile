import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/helper/cash_helper_data.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  String? name;
  getName() {
    name = CashHelperData.cashHelperUserNameValue;
    emit(GetName());
  }

  final FirebaseService _service = FirebaseService();

  Future<void> fetchActiveCompanies() async {
    emit(LoadingGetCompanies());
    try {
      List<DepartmentsModel> departmentsList = [];

      List<DocumentSnapshot> data = await _service.getActiveCompanies();

      // Process the retrieved data as needed
      for (var snapshot in data) {
        DepartmentsModel department =
            DepartmentsModel.fromDocumentSnapshot(snapshot);
        departmentsList.add(department);
      }
      emit(SuccessGetCompanies(departmentsList));
    } catch (e) {
      emit(FailedGetCompanies(e.toString()));
    }
  }
}
