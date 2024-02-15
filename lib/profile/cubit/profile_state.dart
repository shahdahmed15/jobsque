abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileSignOutLoadingState extends ProfileState{}
class ProfileSignOutSuccessState extends ProfileState{
  final String uId;
  ProfileSignOutSuccessState(this.uId);
}
class ProfileSignOutErrorState extends ProfileState{
  final String error;
  ProfileSignOutErrorState(this.error);
}