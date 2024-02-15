import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'complet_profile.dart';

class Experience_screen extends StatefulWidget {
  const Experience_screen({Key? key}) : super(key: key);

  @override
  State<Experience_screen> createState() => _Experience_screenState();
}

class _Experience_screenState extends State<Experience_screen> {
  TextEditingController _positionController = TextEditingController();
  TextEditingController _typeworkController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _startController = TextEditingController();
   List<String> typework = ["Full Time", "Part Time", "Remote","OnSite"];
  bool value = true;

  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("Experience_users");
    return _collectionRef.doc(currentUser!.email).set({
      "position":_positionController.text,
      "type_work":_typeworkController.text,
      "company_name":_companyController.text,
      "location":_locationController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>Complete_Profile()))).catchError((error)=>print("something is wrong. $error"));
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
        title: Text("Experience",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
         padding: EdgeInsets.all(20),
         child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
           child: Container(
            padding: const EdgeInsets.all(10.0),
             decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
           borderRadius: BorderRadius.all(Radius.circular(10)),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ///position
                 SizedBox(height: 15),
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Position',
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
                 TextFormField(controller: _positionController,
                   decoration:InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: "Position ",
                   ) ,
                 ),
                 ///type work
                 SizedBox(height: 15),
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Type of work',
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
                    controller: _typeworkController,
                    decoration: InputDecoration(
                      hintText: "Choose your Type Work",
                      border: OutlineInputBorder(),
                      prefixIcon: DropdownButton<String>(
                        items: typework.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                            onTap: () {
                              setState(() {
                                _typeworkController.text = value;
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                 ///company
                 SizedBox(height: 15),
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Company Name',
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
                 TextFormField(controller: _companyController,
                   decoration:InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: "company name ",

                   ) ,
                 ),
                 ///location
                 SizedBox(height: 15),
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Location',
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
                 TextFormField(controller: _locationController,
                   decoration:InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: "Location ",
                     prefixIcon: Icon(Iconsax.location),
                   ) ,
                 ),
                 Row(
                   children: [
                     Checkbox(
                         value: this.value,
                         onChanged: (bool? value) {
                           setState(() {
                             this.value = value!;
                           });
                         }),
                     Text("I am currently working in this role "),
                   ],
                 ),
                 SizedBox(height: 15),
                 Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(
                         text: 'Start Year*',
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
                 TextFormField(controller: _startController,
                   decoration:InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: "start year ",
                     prefixIcon: Icon(Iconsax.location),
                   ) ,
                 ),
                 SizedBox(
                   height: 50,
                 ),

                 // material button
                 Align(
                     alignment: Alignment.bottomCenter,
                     child: MaterialButton(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                       onPressed: (){sendUserDataToDB();},
                       child: Text("Save"),
                       color: Colors.blue,
                       textColor: Colors.white,
                       minWidth: 400,
                       height: 50,
                     ))



               ],
             ),
           )
         )
        ),
      ),


    );
  }
}
