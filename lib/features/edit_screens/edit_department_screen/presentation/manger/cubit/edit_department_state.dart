abstract class EditDepartmentState {}

class EditDepartmentInitial extends EditDepartmentState {}

class CompaniesLoaded extends EditDepartmentInitial {
  final List<String> companiesNames;
  final String? selectedCompany;
  CompaniesLoaded({required this.companiesNames, this.selectedCompany});
}

class CompaniesError extends EditDepartmentInitial {
  final String errorMessage;

  CompaniesError(this.errorMessage);
}

class CompaniesLoading extends EditDepartmentInitial {}

class LoadingUpdateDepartment extends EditDepartmentInitial {}

class SuccessUpdateDepartment extends EditDepartmentInitial {}

class FaieldUpdateDepartment extends EditDepartmentInitial {
  final String error;
  FaieldUpdateDepartment(this.error);
}
