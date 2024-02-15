import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../Apply_Job/widget/custom_phone_field.dart';
import '../compant.dart';
import '../layout/TheMaster.dart';

class fetch_bio extends StatefulWidget {
  const fetch_bio({Key? key}) : super(key: key);

  @override
  State<fetch_bio> createState() => _fetch_bioState();
}

class _fetch_bioState extends State<fetch_bio> {

  TextEditingController ?_userNameController;
  TextEditingController ?_emailController;
  TextEditingController ?_phoneController;

  setDataToTextField(data){
    return  SingleChildScrollView(
      child:  Column(
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
                      child: Icon(Icons.check_rounded,color: Colors.white,size: 40,),
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
            controller: _userNameController = TextEditingController(text: data['name']),
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
            controller:  _emailController = TextEditingController(text: data['email']),
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
              controller:  _phoneController = TextEditingController(text: data['phone']),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {

              },
              child:Text('Next'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 400,
              height: 50,
            ),
          ),
        ],
      )
    );
  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("Bio");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update(
        {
          "name":_userNameController?.text,
          "phone":_phoneController?.text,
          "email":_emailController?.text,
        }
    ).then((value) => print("Updated Successfully"));
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
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Bio").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            var data = snapshot.data;
            if(data==null){
              return Center(child: CircularProgressIndicator(),);
            }
            return setDataToTextField(data);
          },

        ),
      )),
    );
  }
}
