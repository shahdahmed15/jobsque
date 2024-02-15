import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/profile/login_security/phone.dart';
import 'package:jobsquee/profile/login_security/two_step1.dart';
import 'changepassword.dart';
import 'emailaddress.dart';



class LoginAndSecurityScreen extends StatefulWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  State<LoginAndSecurityScreen> createState() => _LoginAndSecurityScreenState();
}

class _LoginAndSecurityScreenState extends State<LoginAndSecurityScreen> {
  sendData(data){
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10,top: 5),
              color: Colors.grey[350],
              width: double.infinity,
              height: 30,
              child: Text("Account access ",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CustomAccountAccessTile(title: "EmailAddress",trailingTitle: data['email'],
                    onTap: (){
                    navigatorPage(context, Email_address());
                    },
                  ),
                  CustomAccountAccessTile(title: "Phone number",
                    onTap: (){
                    navigatorPage(context, phone_number());
                    },
                  ),
                  CustomAccountAccessTile(title: "Change Password",
                    onTap: (){
                   navigatorPage(context, ChangePasswordScreen());
                     // navigatorPage(context, ChangePassword());
                    },
                  ),
                  CustomAccountAccessTile(
                    title: 'Two-step verification',
                    trailingTitle: 'Non active',
                    onTap: (){
                      navigatorPage(context, TwoStepVerification1());
                    },
                  ),
                  const CustomAccountAccessTile(title: 'Face ID'),


                ],
              ),
            ),

          ],
        ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight: 70,elevation: 0,centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 20,
              icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
        ),
        title: Text("Login and Security",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          var data = snapshot.data;
          if(data==null){
            return Center(child: CircularProgressIndicator(),);
          }
          return sendData(data);
        },

      ),
    );
  }
}


//////////////////////////////////////////////////////////////////////////
class CustomAccountAccessTile extends StatelessWidget {
  final String title;
  final String? trailingTitle;
  final  void Function()? onTap;
  const CustomAccountAccessTile( {super.key, required this.title,  this.trailingTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:  TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'SFProDisplay',
                )),
            SizedBox(width: 5),
            trailingTitle != null
                ? Flexible(
              child: SizedBox(
                width: 150,
                child: Row(

                  children: [
                    Expanded(
                      child: Text(trailingTitle!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:  TextStyle(
                            fontSize: 11.5, fontWeight: FontWeight.w400,
                            fontFamily: 'SFProDisplay',
                            color: Colors.black,
                          )),
                    ),
                    const Icon(Iconsax.arrow_right_1)
                  ],
                ),
              ),
            )
                : const Icon(Iconsax.arrow_right_1),
          ],
        ),
      ),
    );
  }
}