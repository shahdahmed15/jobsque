import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import '../../../../compant.dart';
import '../../../../layout/TheMaster.dart';
import '../../../../shared/cubit/auth_cubit.dart';
import '../../../../shared/cubit/state.dart';
import '../../../../shared/network/cacheHelper.dart';
import '../../register/Register.dart';
import '../forgetpassword/forget_screen/forgetpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool value = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AuthCubit(),
      child:BlocConsumer<AuthCubit, SocialAuthState>(
        listener: (context, state) {
          if(state is AuthLoginErrorState){
            print('Error just happened in login state');

          }
          if(state is AuthLoginSuccessState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId
            ).then((value) {
              navigatorPage(context, SocialLayout());
            });
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(

            body: Stack(
              children: [
                Positioned(
                  top: 50,
                    left: 268,
                    child: Image.asset('assets/images/Logo.png')
                ),
                  SizedBox(height: 200,),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 100,left: 20),
                        child: Text("Login",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),

                      ) ,
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Text("Please login to find your dream job",style: TextStyle(color: Colors.grey,fontSize: 14))),

                    ],
                  ),
                Container(
                  height: double.infinity,
                  //width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 230),
                  child:SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                          defaultFormField(
                          labelName: 'Email',
                          controller: emailController,
                          iconData: Icons.person,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'must not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                        defaultFormField(
                          labelName: 'Password',
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          iconData: Icons.lock,
                          suffix: cubit.suffixIcon,
                          obscureTextPassword: cubit.isPassword,
                          onpressIcon: () => cubit.changePasswordVisibilityFunc(),
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Password must be at least 8 character';
                            } if(value.length<8){
                              return 'Password must be at least 8 character';
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                            Row(
                              children: [
                                Checkbox(
                                  value: this.value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  }),
                                Text("Remember me "),
                                SizedBox(width: 110,),
                                TextButton(onPressed: (){
                                  navigatorPage(context, ForgetPasswordScreen());
                                },
                                    child: Text("Forgot Password?",style: TextStyle(color: Colors.blue),)
                                )
                              ],
                            ),
                            Container(height: 170,),
                            InkWell(
                              onTap: () {
                                navigatorPage(context, SignUpScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 70,right: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Dont’t have an account?',
                                    ),
                                    TextButton(onPressed: (){
                                      navigatorPage(context, SignUpScreen());
                                    }, child: Text("Register"))
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                            //  clipBehavior: Clip.antiAliasWithSaveLayer.,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                   navigatorPage(context, SocialLayout());

                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                color: Colors.blue,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Text("------Or Sign up With Account-------"),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 150,
                                    child: GFButton(
                                      onPressed: (){},
                                      text: 'Google',
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: GFColors.DARK,
                                      ),
                                      icon: Image.asset(
                                        'assets/images/google.png',
                                        height: 22,
                                      ),
                                      type: GFButtonType.outline,
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 150,
                                    child: GFButton(
                                      onPressed: (){},
                                      text: 'Facebook',
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: GFColors.DARK,
                                      ),
                                      icon: Icon(Icons.facebook,color: Colors.blue),
                                      type: GFButtonType.outline,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]
                        )
                    ),
                  ) ,
                ),



              ],
            ),

          );
        },
      ) ,
    );
  }
}





