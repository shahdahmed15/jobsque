import 'package:flutter/material.dart';

import '../../../../../compant.dart';
import 'create_new_password.dart';
class CheckMailForgotPasswordScreen extends StatelessWidget {
  const CheckMailForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // margin: EdgeInsets.,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset( "assets/images/Ilustration.png"),


              Text("Check your Email",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
              Text("We have sent a reset password to your email address",style: TextStyle(color: Colors.grey),),
              Container(height: 400),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue
                ),
                child: MaterialButton(
                  onPressed: (){
                    navigatorPage(context, createNewPasswordScreen());

                  },
                  child: Text("Open Email App",
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
    );
  }
}