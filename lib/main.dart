
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsquee/profile/cubit/profile_cubit.dart';
import 'package:jobsquee/shared/cubit/auth_cubit.dart';
import 'package:jobsquee/shared/cubit/cubit.dart';
import 'package:jobsquee/shared/cubit/state.dart';
import 'package:jobsquee/shared/network/cacheHelper.dart';
import 'package:jobsquee/ui/social_login/login/forgetpassword/view_model/forgetCubit.dart';
import 'package:jobsquee/ui/splash_screen/splashscreen.dart';
import 'Apply_Job/job_cubit/cubit.dart';
import 'const.dart';
import 'firebase_options.dart';
import 'layout/TheMaster.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  uId=CacheHelper.getData2(key: "uId");
  if(uId!=null){
    widget=SocialLayout();
  }else{
    widget=SplashScreen();
  }


  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SocialCubit()),
          BlocProvider(create: (context)=>AuthCubit()),
          BlocProvider(create: (context)=>SocialCubitt()..getUserData()),
          BlocProvider(create: (context)=>JobCubit()),
          BlocProvider(create: (context)=>ForgetPasswordCubit()),
          BlocProvider(create: (context)=>ProfileCubit()..signOut()),
          BlocProvider(create: (context)=>ProfileCubit()),
          // BlocProvider(create: (context)=>ResetPasswordCubit()),

        ],
        child: BlocConsumer<SocialCubit,SocialAuthState>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(color: Colors.white),
                    fontFamily: 'Poppins'
                ),
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                home:FirebaseAuth.instance.currentUser==null?SplashScreen():SocialLayout()

            );
          },

        )
    );
  }
}








