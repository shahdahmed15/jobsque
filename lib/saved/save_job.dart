import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/Job_details.dart';
import 'package:jobsquee/home/widget/Recent_Job.dart';
import 'package:slide_switcher/slide_switcher.dart';

class Saved_item extends StatefulWidget {
  const Saved_item( {Key? key}) : super(key: key);

  @override
  State<Saved_item> createState() => _Saved_itemState();
}

class _Saved_itemState extends State<Saved_item> {
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
          title: Text("Saved",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),

        ),


        body:SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users-favourite-items").doc(FirebaseAuth.instance.currentUser!.email)
              .collection("items").snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(snapshot.hasError){
              return Center(child: Image.asset("assets/images/saved.png"),);
            }
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index){
                    DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(20),
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
                            trailing: IconButton(onPressed: (){
                              showModalBottomSheet(context: context,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)
                                      )
                                  ),
                                  builder:((context){
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width:double.maxFinite,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                child: ListTile(leading: Icon( Iconsax.directbox_notif),title: Text("Apply job"),trailing:Icon(Icons.arrow_forward_ios) ),
                                              ),
                                              SizedBox(height: 15,),
                                              Container(
                                                alignment: Alignment.center,
                                                width:double.maxFinite,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.black),
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                child: ListTile(leading: Icon(Iconsax.export),title: Text("Share via..."),trailing:Icon( Icons.arrow_forward) ),
                                              ),
                                              SizedBox(height: 15,),
                                              GestureDetector(
                                                onTap: (){
                                                  FirebaseFirestore.instance.collection("users-favourite-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(_documentSnapshot.id).delete();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width:double.maxFinite,
                                                  height: 50,
                                                  decoration: BoxDecoration(border: Border.all(color: Colors.black),
                                                      borderRadius: BorderRadius.circular(30)
                                                  ),
                                                  child: ListTile(leading: Icon(Iconsax.archive_minus),title: Text("Cansel Saved"),trailing:Icon(Icons.arrow_forward_ios) ),
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              );
                            }, icon: Icon(Iconsax.more,color: Colors.black,)),
                            contentPadding: EdgeInsets.zero,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Posted 2 days ago",style: TextStyle(fontSize: 10),),

                              Text("Be an early applicent",style: TextStyle(fontSize: 10))



                            ],
                          )

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: snapshot.data!.docs.length
              ),
            );
          },
        ),
      )
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////


