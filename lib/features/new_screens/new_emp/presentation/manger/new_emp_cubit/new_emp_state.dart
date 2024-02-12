
abstract class NewEmpState {}

class NewEmpInitial extends NewEmpState {}

///////////////////////////////////////////////////
class UploadImageLoading extends NewEmpState {}

class UploadImageSuccess extends NewEmpState {}

class UploadImageFailed extends NewEmpState {
  final String error;
  UploadImageFailed({required this.error});
}

///////////////////////////////////////////////////
class CreateEmpLoading extends NewEmpState {}

class CreateEmpSuccess extends NewEmpState {}

class CreateEmpFailure extends NewEmpState {
  final String error;
  CreateEmpFailure({required this.error});
}

///////////////////////////////////////////////////
class LoadingGetImageFromGallery extends NewEmpState {}

class GetImageFromGallery extends NewEmpState {}

class ErrorImageFromGallery extends NewEmpState {
  
}

///////////////////////////////////////////////////
class DropMenuChanged extends NewEmpState {}
