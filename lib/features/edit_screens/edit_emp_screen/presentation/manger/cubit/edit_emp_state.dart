abstract class EditEmpState {}

class EditEmpInitial extends EditEmpState {}

class DropMenuChanged extends EditEmpState {}

class UpdateEmpLoading extends EditEmpState {}

class UpdateEmpSuccess extends EditEmpState {}

class UpdateEmpFailure extends EditEmpState {
  final String error;
  UpdateEmpFailure({required this.error});
}
