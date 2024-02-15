
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../../../compant.dart';
import '../../../../../shared/cubit/auth_cubit.dart';
import '../../login/login.dart';
import '../view_model/forgetCubit.dart';
import '../view_model/forgetState.dart';
import 'check_email_password.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController=TextEditingController();
  late AuthCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= AuthCubit.get(context);

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top:40,
              child: Row(

                children: [
                  IconButton(onPressed: (){
                    navigatorPage(context, LoginScreen());
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
                child: Text("Reset Password",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),

              ) ,
              SizedBox(height: 15,),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Enter the email address you used when you joined and we’ll send you instructions to reset your password.",style: TextStyle(color: Colors.grey,fontSize: 14))),
              Container(height: 100),
              defaultFormField(
                labelName: 'Enter your Email',
                iconData: Icons.email,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'must not be empty';
                  } else {
                    return null;
                  }
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You remember your password"),
                  TextButton(onPressed: (){
                    navigatorPage(context, LoginScreen());
                  }, child: Text("Login",style: TextStyle(color: Colors.blue),))
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue
                ),
                child: MaterialButton(
                  onPressed:(){
                    navigatorPage(context, CheckMailForgotPasswordScreen());
                  } ,
                  child: Text("Request password reset",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                  ),
                ),

              )


            ],
          ),
        ],
      )
    );
  }
}




/*class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email address to reset your password.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('A password reset link has been sent to your email.')),
                  );
                  navigatorPage(context, CheckMailForgotPasswordScreen());
                } else if (state is ResetPasswordFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context.read<ResetPasswordCubit>().resetPassword(emailController.text);
                  },
                  child: Text('Reset Password'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}*/