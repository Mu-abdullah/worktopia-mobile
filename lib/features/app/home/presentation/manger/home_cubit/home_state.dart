import '../../../../../../core/entities/department_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetName extends HomeState {}

class LoadingGetCompanies extends HomeState {}

class SuccessGetCompanies extends HomeState {
  List<DepartmentsModel> departments;
  SuccessGetCompanies(this.departments);
}

class FailedGetCompanies extends HomeState {
  final String error;
  FailedGetCompanies(this.error);
}

