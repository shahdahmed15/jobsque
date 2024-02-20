import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/shared/cubit/state.dart';
import '../../const.dart';
import '../../model/model.dart';

class AuthCubit extends Cubit<SocialAuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;
  int currentindex = 0;

  void changePasswordVisibilityFunc() {
    isPassword = !isPassword;
    suffixIcon =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthChangePasswordVisibilityState());
  }

  bool isJobSelected = false;
  List<Map>jobCardList = [
    {
      'name': 'UI/UX Designer',
      'icon': Iconsax.bezier
    },
    {
      'name': 'UI/UX Designer',
      'icon': Iconsax.bezier
    },


  ];

  //int index=0;
  void changeSelectedJobType(int index) {
    isJobSelected = !isJobSelected;
    jobCardList[index]['selected'] = isJobSelected;
    emit(SelectedJobTypeCard());
  }


  userRegister({
    required String name,
    required String email,
    required String password,
    required String address,
    required String unvirsity,
    required String title,
    required String startyear,
    required String endyear,
    required String bio,
    required String phone,
    required String about,



  }) {
    emit(AuthSignupLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      userCreate(
        name: name,
        password: password,
        email: email,
          uId: value.user!.uid,
          about: about,
          unvirsity: unvirsity,
          title: title,
          startyear: startyear,
          endyear: endyear,
        address: address,
        phone:phone,
        bio:bio

      );
      emit(AuthSignupSuccessState());
    }).catchError((error) {
      emit(AuthSignupErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String address,
    required String uId,
    required String unvirsity,
    required String title,
    required String startyear,
    required String endyear,
    required String password,
    required String phone,
    required String bio,
    required String about,
  }) {
    SocialUserModel model = SocialUserModel(
      unvirsity: unvirsity,
      title: title,
      startyear: startyear,
      endyear: endyear,
      email: email,
      name: name,
      password: password,
      address: address,
      bio: bio,
      phone: phone,
      about: about,
      uId: uId,
      isEmailVerified: false,

    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then(
            (value) {
          emit(SocialCreateUserSuccess());
        }).catchError((error) {
      emit(SocialCreateUserError(error.toString()));
    });
  }

  userLogin({
    required String email,
    required String password,
  }) {
    emit(AuthLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      uId = value.user!.uid;
      emit(AuthLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(AuthLoginErrorState(error.toString()));
    });
  }

}