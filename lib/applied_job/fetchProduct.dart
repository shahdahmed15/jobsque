import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsquee/Apply_Job/uploadPortoflio.dart';
import 'package:jobsquee/applied_job/fetch_bio.dart';
import 'package:jobsquee/compant.dart';

import '../Apply_Job/type_of_work.dart';
import '../home/widget/Recent_Job.dart';

Widget fetchData (String collectionName){
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(collectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .snapshots(),
    builder:
        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }

      return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                ListTile(
              leading:  Image.network(_documentSnapshot["image"]),
              title: Text(
              _documentSnapshot['name'],
              style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
              ),
              ),
              subtitle: Row(
              children: [
              Text(
              _documentSnapshot['company'],
              style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,
              ),
              ),
              Expanded(
              child: Text(
              "..${_documentSnapshot["location"]}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,
              ),
              ),
              ),
              ],
              ),



              ),
                Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildbutton(color: Colors.blue, text: 'Full time', function: (){}),
                SizedBox(width: 3,),
                buildbutton(color: Colors.blue, text: 'Remote', function: (){}),
                SizedBox(width: 150),
              Text("Posted 2 days ago",style: TextStyle(fontSize: 10),),


              ],


              ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: Row(
                     children: [
                     SizedBox(width: 30,),
                     GestureDetector(
                       onTap: ()=>navigatorPage(context, fetch_bio()),
                       child: CircleAvatar(
                             radius: 20, backgroundColor: Colors.blue, child: CircleAvatar(
                                radius: 25, backgroundColor: Colors.white, child: Text(
                         "1", style: TextStyle(fontSize: 30),),
              ),
              ),
                     ),
                      SizedBox(width: 50,),
                       GestureDetector(
                         onTap: ()=>navigatorPage(context, TypeOfWorkScreen ()),
                         child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Text(
              "2",
              style: TextStyle(fontSize: 30),
              ),
              ),
              ),
                       ),
                          SizedBox(width: 50,),
              GestureDetector(
                onTap: ()=>navigatorPage(context, upload_portflio()),
                child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Text(
                "3",
                style: TextStyle(fontSize: 30),
                ),
                ),
                ),
              ),
              ],
              ),
                    ),

              ]),
            );
          });
    },
  );
}


