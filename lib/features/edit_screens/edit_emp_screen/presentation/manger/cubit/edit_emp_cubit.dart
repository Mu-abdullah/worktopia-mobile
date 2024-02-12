import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/fire_base_services.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'edit_emp_state.dart';

class EditEmpCubit extends Cubit<EditEmpState> {
  EditEmpCubit() : super(EditEmpInitial());
  static EditEmpCubit get(context) => BlocProvider.of(context);

  String? jobStatus;

  void changeJobStatus(value) {
    jobStatus = value;
    emit(DropMenuChanged());
  }

  List<String> jobStatusItems = [
    "على قوة العمل",
    "الاستقالة",
    "استبعاد",
  ];
  List<String> jobStatusItemss = [
    FBFirestoreName.empJobStatusOnWork,
    FBFirestoreName.empJobStatusResigned,
    FBFirestoreName.empJobStatusTermination,
  ];

  String? jobSatausToFirebase() {
    if (jobStatus == "الاستقالة") {
      return FBFirestoreName.empJobStatusResigned;
    }
    if (jobStatus == "استبعاد") {
      return FBFirestoreName.empJobStatusTermination;
    } else {
      return FBFirestoreName.empJobStatusOnWork;
    }
  }

  Future<void> update({
    required EmpsModels emp,
  }) async {
    emit(UpdateEmpLoading());
    try {
      FirebaseService().updateEmp(
        departmentId: emp.departmentId!,
        employeeData: emp,
        empID: emp.empNId!,
      );
      emit(UpdateEmpSuccess());
    } catch (e) {
      emit(UpdateEmpFailure(error: e.toString()));
    }
  }
}
