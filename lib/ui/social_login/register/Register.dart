import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:jobsquee/ui/social_login/register/worktype.dart';
import '../../../compant.dart';
import '../../../shared/cubit/auth_cubit.dart';
import '../../../shared/cubit/state.dart';
import '../../OnBoarding/onboarding.dart';
import '../login/login/login.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  var aboutController = TextEditingController();
  var unviersity = TextEditingController();
  var title = TextEditingController();
  var startyear = TextEditingController();
  var endyear = TextEditingController();

  bool isVisible=true;
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, SocialAuthState>(
      listener: (context, state) {
        if(state is SocialCreateUserSuccess){
          navigatorPage(context, WorkType());

        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
            body: Stack(
              children: [
                 Positioned(
                    top:40,
                      child: Row(

                    children: [
                      IconButton(onPressed: (){
                        navigatorPage(context, OnBoarding());
                      }, icon:Icon(Icons.arrow_back)),
                      SizedBox(width: 200,),
                      Image.asset('assets/images/Logo.png')

                    ],
                  )),
                SizedBox(height: 200,),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 100,left: 20),
                      child: Text("Create Account",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),

                    ) ,
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: Text("Please create an account to find your dream job",style: TextStyle(color: Colors.grey,fontSize: 14))),

                  ],
                ),
                Container(
                  height: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 230),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child:  Column(
                        children: [
                          defaultFormField(
                            labelName: 'User name',
                            type: TextInputType.emailAddress,
                            iconData: Icons.person,
                            controller: userNameController,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'must not be empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          defaultFormField(
                            labelName: 'Email',
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            iconData: Icons.email,
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

                          Container(height: 150,color: Colors.white,),
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Row(
                              children: [
                                Text("Already have an account?"),
                                TextButton(onPressed: (){
                                  navigatorPage(context, LoginScreen());
                                }, child: Text("Login",style: TextStyle(color: Colors.blue),))
                              ],
                            ),
                          ),

                          ConditionalBuilder(
                              condition: state is! AuthSignupLoadingState,
                              builder: (context)=>Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(10),
                                child: MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  color: Colors.blue,
                                  child: const Text(
                                    'Create account',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      AuthCubit.get(context).userRegister(
                                        name: userNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        address: addressController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text,
                                        about: aboutController.text,
                                          unvirsity: unviersity.text,
                                          title: title.text,
                                          startyear: startyear.text,
                                          endyear: endyear.text

                                      );
                                      navigatorPage(context, WorkType());
                                    }
                                  },
                                ),
                              ),
                              fallback: (context)=>Center(child: CircularProgressIndicator())
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
                        ],
                      ),
                    ),
                  ),
                )






                
                
              ],
            )
        );
      },
    );
  }
}
