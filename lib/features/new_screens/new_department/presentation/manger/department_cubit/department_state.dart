abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

////////////////////////////////////////////////////
class CompaniesLoaded extends DepartmentState {
  final List<String> companiesNames;
  final String? selectedCompany;
  CompaniesLoaded({required this.companiesNames, this.selectedCompany});
}

class CompaniesError extends DepartmentState {
  final String errorMessage;

  CompaniesError(this.errorMessage);
}

class CompaniesLoading extends DepartmentState {}

///////////////////////////////////////////////////
class DropMenuChanged extends DepartmentState {}

//////////////////////////////////////////////////
class CreateDepartmentLoading extends DepartmentState {}

class CreateDepartmentSuccess extends DepartmentState {}

class CreateDepartmentFailure extends DepartmentState {
  final String error;
  CreateDepartmentFailure(this.error);
}
