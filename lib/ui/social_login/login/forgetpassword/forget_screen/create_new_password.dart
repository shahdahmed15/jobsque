import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/ui/social_login/login/forgetpassword/forget_screen/password_succesfully.dart';

import '../../../../../compant.dart';
import '../view_model/forgetCubit.dart';
import '../view_model/forgetState.dart';
import 'check_email_password.dart';
import 'forgetpassword_screen.dart';
class createNewPasswordScreen extends StatefulWidget {
  const createNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<createNewPasswordScreen> createState() => _createNewPasswordScreenState();
}

class _createNewPasswordScreenState extends State<createNewPasswordScreen> {
  late ForgetPasswordCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= ForgetPasswordCubit.get(context);

  }
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordCheckController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {},
      builder: (context,state){
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                  top:40,
                  child: Row(

                    children: [
                      IconButton(onPressed: (){
                        navigatorPage(context, CheckMailForgotPasswordScreen());
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
                    child: Text("Create new password",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),

                  ) ,
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text("PSet your new password so you can login and acces Jobsque",style: TextStyle(color: Colors.grey,fontSize: 14))),

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
                        defaultFormField(
                          labelName: 'Confirm Password',
                          controller: passwordCheckController,
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


                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              navigatorPage(context, ForgetpasswordSucess());

                            },
                            child: Text("Rest Password",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

        );
      },

    );
  }
}


