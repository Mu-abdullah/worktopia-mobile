abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingAuth extends AuthState {}

final class SuccessAuth extends AuthState {}

final class FException extends AuthState {
  final String exception;
  FException(this.exception);
}

final class FailedAuth extends AuthState {
  final String error;
  FailedAuth(this.error);
}
