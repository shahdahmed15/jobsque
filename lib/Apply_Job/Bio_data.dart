import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/job_cubit/state.dart';
import 'package:jobsquee/Apply_Job/type_of_work.dart';
import 'package:jobsquee/Apply_Job/widget/custom_phone_field.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/layout/TheMaster.dart';
import 'job_cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {

  final  userNameController = TextEditingController();
  final  emailController= TextEditingController();
  final  phoneController =TextEditingController();
  final  addressController =TextEditingController();

  //late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    //dbRef = FirebaseDatabase.instance.ref().child('Students');
  }
  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("Bio");
    return _collectionRef.doc(currentUser!.email).set({
      "name":userNameController.text,
      "phone":phoneController.text,
      "email":emailController.text,


    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>TypeOfWorkScreen()))).catchError((error)=>print("something is wrong. $error"));
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
          title: Text("Apply Job",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
        ),

      body:Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 30,),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Text(
                              "1",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(width: 50,),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Text(
                              "2",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(width: 50,),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Text(
                              "3",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(width: 40,),
                        Text("Biodata",style: TextStyle(color: Colors.blue,fontSize: 10),),
                        SizedBox(width: 80,),
                        Text("Type of work",style: TextStyle(color: Colors.blue,fontSize: 10),),
                        SizedBox(width: 40,),
                        Text("Upload portfolio",style: TextStyle(color: Colors.blue,fontSize: 10),),

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Biodata',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w700,

                ),
              ),
              Text(
                'Fill in your bio data correctly',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Full Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name',
                ),
              ),
              SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  border: OutlineInputBorder(),
                  hintText: 'email',
                ),
              ),
              SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'No.Handphone',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13.5,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1),
              CustomPhoneTextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return'cannot be empty';
                    }
                    if (value.length < 10) {


                      return 'Phone must be 11 characters';
                    }

                    else{
                      return null;
                    }
                  },
                  controller: phoneController),

              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {

                    sendUserDataToDB();
                    navigatorPage(context, SocialLayout());

                  },
                  child:Text('Next'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 400,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


