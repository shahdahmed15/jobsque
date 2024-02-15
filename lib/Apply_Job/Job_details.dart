import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/Bio_data.dart';
import 'package:jobsquee/Apply_Job/screen/job_details_pepole.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/home/screen/Home.dart';
import 'package:jobsquee/layout/TheMaster.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../home/widget/Recent_Job.dart';

class job_details extends StatefulWidget {
  var _job;
   job_details(this._job);



  @override
  State<job_details> createState() => _job_detailsState();
}

class _job_detailsState extends State<job_details> {
  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-cart-items");
    return _collectionRef.doc(currentUser!.email).collection("items").doc().set({
      "name": widget._job["name"],
      "location": widget._job["location"],
      "image": widget._job["image"],
      "company": widget._job["company"],
    }).then((value) => print("Added to cart"));
  }

  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._job["name"],
      "location": widget._job["location"],
      "image": widget._job["image"],
      "company": widget._job["company"],

    }).then((value) => print("Added to favourite"));
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
        title: Text("Job Detail",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
        actions: [
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection("users-favourite-items").doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items").where("name",isEqualTo: widget._job['name']).snapshots(),
              builder:  (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Text("data");
                }
                return IconButton(
                    onPressed: () => snapshot.data.docs.length==0?addToFavourite():print("Already Added"),
                    icon: snapshot.data.docs.length==0? Icon(
                      Iconsax.archive_minus,
                      color: Colors.grey,
                    ): Icon(
                        Iconsax.archive_add4,
                        color: Colors.blue,

                    ));
              }
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                width: 100,height: 100,
                child: Image.network(widget._job['image']),
              ),
              Text(widget._job['name'],style: TextStyle(fontSize: 25),),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget._job['location'],style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 3,),
                  Text('• ${widget._job['company']}',style: TextStyle(color: Colors.grey),),


                ],),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                buildbutton(color: Colors.blue, text: 'Full time', function: (){}),
                SizedBox(width: 3,),
                buildbutton(color: Colors.blue, text: 'Remote', function: (){}),
                SizedBox(width: 3,),
                buildbutton(color: Colors.blue, text: 'Senior', function: (){}),
              ],),
              SizedBox(height: 15,),

              Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(30)),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(color: Colors.blue[900],borderRadius: BorderRadius.circular(30)),
                 tabs: [Tab(text: 'Description',),Tab(text: 'Company',),Tab(text: 'Pepole',)],
                ),

              ),
              Expanded(child: TabBarView(
                children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job Description",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                          SizedBox(height: 5,),
                          Text(widget._job['job_des'],style: TextStyle(fontSize: 15,color: Colors.grey),),
                          Text("Skill Required",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                          SizedBox(height: 5,),
                          Text(widget._job['skills'],style: TextStyle(fontSize: 15,color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact Us",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // height: 8,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        widget._job['email'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.5,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w500,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Container(
                                  //height: 15,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Website',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w400,

                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        widget._job['web_site'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.5,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w500,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            'About Company',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900,

                            ),
                          ),
                          SizedBox(height: 10),
                          Text(widget._job['com_des'],style: TextStyle(fontSize: 15,color: Colors.grey),),


                        ],
                      ),
                    ),
                  ),
                  Container(child: JobDetailsPepole(),)
                ],
              )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      addToCart();
                    },
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          addToCart();
                          navigatorPage(context, BioScreen());},child: Text("Apply now",style: TextStyle(color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}




//////////////////////////
class apply_screen extends StatefulWidget {
  const apply_screen({Key? key}) : super(key: key);

  @override
  State<apply_screen> createState() => _apply_screenState();
}

class _apply_screenState extends State<apply_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}

////////////

