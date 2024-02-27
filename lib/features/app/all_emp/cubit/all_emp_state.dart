import 'package:worktopia/core/entites/department_model.dart';
import 'package:worktopia/core/entites/emoloyees_model.dart';

abstract class AllEmpState {}

class AllEmpInitialState extends AllEmpState {}

class LoadingAllEmpState extends AllEmpState {}

class SuccessAllEmpState extends AllEmpState {
  List<EmployeesModel>? emps;
  List<DepartmentsModel>? department;
  SuccessAllEmpState({
    this.emps,
    this.department,
  });
}

class FailedAllEmpState extends AllEmpState {
  final String error;
  FailedAllEmpState(this.error);
}
