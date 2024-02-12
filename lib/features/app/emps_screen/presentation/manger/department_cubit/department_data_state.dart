abstract class DepartmentDataState {}

final class DepartmentDataInitial extends DepartmentDataState {}

class ChangeTapBarItem extends DepartmentDataState {}

class Loading extends DepartmentDataState {}

class SuccessDepartmentData extends DepartmentDataState {}

class FaieldDepartmentData extends DepartmentDataState {
  final String error;
  FaieldDepartmentData(this.error);
}
