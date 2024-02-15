import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';

class Email_address extends StatelessWidget {
   Email_address({Key? key}) : super(key: key);
   TextEditingController ?_emailController;
sendData(data){
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Main e-mail address"),
        TextFormField(
          decoration:InputDecoration(
              border: OutlineInputBorder()),
          controller: _emailController = TextEditingController(text: data['email']),
        ),
        Spacer(),
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
           "email":_emailController!.text,


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
        title: Text("Email address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
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
