import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../compant.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/state.dart';
import '../login/login/login.dart';
import 'country.dart';
class AccountCreated extends StatelessWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAuthState>(
      listener: (context,state){},
        builder: (context,state){
        return Scaffold(
          body: Container(
           // margin: EdgeInsets.,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(
                    top:40,
                    child: Row(

                      children: [
                        IconButton(onPressed: (){
                          navigatorPage(context, Location());
                        }, icon:Icon(Icons.arrow_back)),
                        SizedBox(width: 200,),


                      ],
                    )),
                Image.asset("assets/images/Success Account.png"),
                Text("Your account has been set up!",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
                Text("We have customized feeds according to your preferences",style: TextStyle(color: Colors.grey),),
                Container(height: 400),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      navigatorPage(context, LoginScreen());

                    },
                    child: Text("Get Started",
                        style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                    ),
                  ),

                )
              ],
            ),
          ),
        );
    },
       
    );
  }
}
