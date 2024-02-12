abstract class NewCompanyState {}

class NewCompanyInitial extends NewCompanyState {}

class LoadingNewCompany extends NewCompanyState {}

class SuccessNewCompany extends NewCompanyState {}

class FailedNewCompany extends NewCompanyState {
  final String error;
  FailedNewCompany(this.error);
}
