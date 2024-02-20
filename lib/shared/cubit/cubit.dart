import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/uploadPortoflio.dart';
import 'package:jobsquee/applied_job/fetch_bio.dart';
import 'package:jobsquee/message/screens/message_screen.dart';
import 'package:jobsquee/profile/completeProfile/portflio.dart';
import 'package:jobsquee/profile/profile.dart';
import 'package:jobsquee/saved/save_job.dart';
import 'package:jobsquee/shared/cubit/state.dart';
import '../../applied_job/appliedscreen.dart';
import '../../home/screen/Home.dart';
import '../../const.dart';
import '../../model/model.dart';



class SocialCubit extends Cubit<SocialAuthState> {
  SocialCubit() : super(InitialAuthState());
  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  navigatorPage(context, widget) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => widget));
 // List<String>titles = ['HomeScreen', 'ChatScreen', 'UserScreen', 'SettingScreen',"hhhhhhhhh"];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Messge'),
    BottomNavigationBarItem(icon: Icon(Iconsax.briefcase), label: "Applied"),
    BottomNavigationBarItem(icon: Icon(Iconsax.archive_minus), label: "Saved"),
    BottomNavigationBarItem(icon: Icon(Iconsax.user), label: "Profile"),

  ];
  final screens=[HomeScreen(),MessagesScreen(),Applied_Screen(),Saved_item(),profile_screen()];
  void changeBottomNav(int index){
    currentIndex=index;
    emit(NewsBottomNavStates());
  }



}

class SocialCubitt extends Cubit<SocialAuthState> {
  SocialCubitt() : super(InitialAuthState());
  static SocialCubitt get(context) => BlocProvider.of(context);
  late SocialUserModel model;
  void getUserData(){
    emit(SocialGetUserLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      print(value.data());
      model=SocialUserModel.fromJson(value.data());//store in cloude
      emit(SocialGetUserSuccess());
    }).catchError((error){
      emit(SocialGetUserError(error.toString()));
    });

  }

  int currentIndex = 0;
  navigatorPage(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );




}


