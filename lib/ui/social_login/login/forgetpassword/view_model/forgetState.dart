abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordChangePasswordVisibilityState extends ForgetPasswordState  {}
/*abstract class ResetPasswordState {}
class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
String uId;
ResetPasswordSuccess(this.uId);
}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;

  ResetPasswordFailure({required this.message});
}*/