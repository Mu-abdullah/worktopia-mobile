import 'package:worktopia/core/entites/emoloyees_model.dart';

abstract class AllEmpState {}

class AllEmpInitialState extends AllEmpState {}

class LoadingAllEmpState extends AllEmpState {}

class SuccessAllEmpState extends AllEmpState {
  List<EmployeesModel> emps;
  SuccessAllEmpState(this.emps);
}

class FailedAllEmpState extends AllEmpState {
  final String error;
  FailedAllEmpState(this.error);
}
