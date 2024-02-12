import '../../../../../../core/entites/emoloyees_model.dart';

abstract class TerminationEmpState {}

final class TerminationEmpInitial extends TerminationEmpState {}
class Loading extends TerminationEmpState {}

class SuccessSubCollection extends TerminationEmpState {
  List<EmpsModels> departments;
  SuccessSubCollection(this.departments);
}

class FailedSubCollection extends TerminationEmpState {
  final String error;
  FailedSubCollection(this.error);
}
