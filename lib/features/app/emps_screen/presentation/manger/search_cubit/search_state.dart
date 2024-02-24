import '../../../../../../core/entites/emoloyees_model.dart';

abstract class SearchState {}

class SearchCubitInitial extends SearchState {}

class LoadingSearch extends SearchState {}

class SuccessSearch extends SearchState {
  List<EmployeesModel> empList;
  SuccessSearch(this.empList);
}

class FailedSearch extends SearchState {
  final String error;
  FailedSearch(this.error);
}

class NotFoundSearch extends SearchState {}
