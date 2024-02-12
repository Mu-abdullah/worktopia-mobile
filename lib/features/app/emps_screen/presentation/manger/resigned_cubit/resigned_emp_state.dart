import '../../../../../../core/entites/emoloyees_model.dart';

abstract class ResignedEmpState {}

class ResignedEmpInitial extends ResignedEmpState {}

class Loading extends ResignedEmpState {}

class SuccessSubCollection extends ResignedEmpState {
  List<EmpsModels> departments;
  SuccessSubCollection(this.departments);
}

class FailedSubCollection extends ResignedEmpState {
  final String error;
  FailedSubCollection(this.error);
}
