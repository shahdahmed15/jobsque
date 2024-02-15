import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/const.dart';
import 'package:jobsquee/profile/profile.dart';

import '../../Apply_Job/widget/custom_phone_field.dart';


class Edit_Screen extends StatefulWidget {
  @override
  _Edit_ScreenState createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  TextEditingController ?_nameController;
  TextEditingController ?_phoneController;
  TextEditingController ?_bioController;
  TextEditingController ?_addressController;



  setDataToTextField(data){
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Name *',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),
            controller: _nameController = TextEditingController(text: data['name']),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Bio*',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            decoration: InputDecoration(
                hintText: "write your job",
                border: OutlineInputBorder()
            ),
            controller: _bioController = TextEditingController(text: data['bio']),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Address*',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 2,),
          TextFormField(
            decoration: InputDecoration(
              hintText: "write your address",
              border: OutlineInputBorder()
            ),
            controller: _addressController = TextEditingController(text: data['address']),
          ),
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'phone*',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 2,),
          CustomPhoneTextFormField(
            controller: _phoneController = TextEditingController(text: data['phone']),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                onPressed: (){updateData();},
                child: Text("Save"),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 400,
                height: 50,
              ))

        ],
      ),
    );
  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          "name":_nameController!.text,
          "phone":_phoneController!.text,
          "bio":_bioController!.text,
          "address":_addressController!.text,

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
        title: Text("Edit Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
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


