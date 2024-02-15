import 'package:flutter/material.dart';

import '../../../../../compant.dart';
import '../../login/login.dart';
import 'create_new_password.dart';
import 'forgetpassword_screen.dart';
class ForgetpasswordSucess extends StatelessWidget {
  const ForgetpasswordSucess({Key? key}) : super(key: key);

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
              SizedBox(height: 50,),

              Image.asset( "assets/images/Password Succesfully Ilustration.png"),


              Text("Password changed succesfully!",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
              Center(child: Text("Your password has been changed successfully,\n we will let you know if there are more problems\n with your account",style: TextStyle(color: Colors.grey),)),
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
                    navigatorPage(context, LoginScreen());

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

