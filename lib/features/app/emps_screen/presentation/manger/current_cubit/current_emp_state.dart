

import '../../../../../../core/entites/emoloyees_model.dart';

abstract class CurrentEmpState {}

class CurrentEmpInitial extends CurrentEmpState {}

class Loading extends CurrentEmpState {}

class SuccessSubCollection extends CurrentEmpState {
  List<EmpsModels> departments;
  SuccessSubCollection(this.departments);
}

class FailedSubCollection extends CurrentEmpState {
  final String error;
  FailedSubCollection(this.error);
}

class SuccessCurrentEmp extends CurrentEmpState {}

class FaieldCurrentEmp extends CurrentEmpState {}



