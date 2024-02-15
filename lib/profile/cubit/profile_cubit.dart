import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsquee/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> signOut() async {
    emit(ProfileSignOutLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      var value;
      emit(ProfileSignOutSuccessState(value.user!.uid));
    } catch (e) {
      emit(ProfileSignOutErrorState(e.toString()));
    }
  }

}