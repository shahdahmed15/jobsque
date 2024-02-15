abstract class SocialAuthState {}

class InitialAuthState extends SocialAuthState {}

class AuthLoginLoadingState extends SocialAuthState {}

class AuthLoginSuccessState extends SocialAuthState {
  final String uId;
  AuthLoginSuccessState(this.uId);
}

class AuthLoginErrorState extends SocialAuthState {
  final String error;
  AuthLoginErrorState(this.error);
}
//Signout
class AuthSignOutLoadingState extends SocialAuthState{}
class AuthSignOutSuccessState extends SocialAuthState{
  final String uId;
  AuthSignOutSuccessState(this.uId);
}
class AuthSignOutErrorState extends SocialAuthState{
  final String error;
  AuthSignOutErrorState(this.error);
}
//Signup
class AuthSignupLoadingState extends SocialAuthState {}

class AuthSignupSuccessState extends SocialAuthState {}

class AuthSignupErrorState extends SocialAuthState {
  final String error;
  AuthSignupErrorState(this.error);
}

class AuthChangePasswordVisibilityState extends SocialAuthState {}

class SocialCreateUserError extends SocialAuthState{
  late String error;
  SocialCreateUserError(this.error);
}

class SocialCreateUserSuccess extends SocialAuthState{}

//social layout
class SocialGetUserLoading extends SocialAuthState{}
class SocialGetUserSuccess extends SocialAuthState{}
class SocialGetUserError extends SocialAuthState{
  late String error;
  SocialGetUserError(this.error);
}
class NewsBottomNavStates extends SocialAuthState{}
class SelectedJobTypeCard extends SocialAuthState{}






