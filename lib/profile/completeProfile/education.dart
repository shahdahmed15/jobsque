import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/layout/TheMaster.dart';

import 'complet_profile.dart';
/*class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  TextEditingController _unviersityController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _startController = TextEditingController();
  TextEditingController _endController = TextEditingController();


  Future<void> _selectDateFromPicker1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _startController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";

      });
  }
  Future<void> _selectDateFromPicker2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _endController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";

      });
  }

  setDataToTextField(data){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///unvirsity
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'University *',
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
            TextFormField(controller: _unviersityController= TextEditingController(text: data['university']),
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: "University ",
              ) ,
            ),
            ///title
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Title',
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
            TextFormField(controller: _titleController= TextEditingController(text: data['title']),
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title ",
              ) ,
            ),
            ///start
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Start Year',
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
            TextFormField( controller: _startController= TextEditingController(text: data['startyear']),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "start year",
                suffixIcon: IconButton(
                  onPressed: () => _selectDateFromPicker1(context),
                  icon: Icon(Iconsax.calendar_1),
                ),


              ),
            ),
            ///end
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'End Tear',
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
            TextFormField( controller: _endController= TextEditingController(text: data['endyear']),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "end year",
                suffixIcon: IconButton(
                  onPressed: () => _selectDateFromPicker2(context),
                  icon: Icon(Iconsax.calendar_1),
                ),


              ),
            ),




            SizedBox(
              height: 50,
            ),

// material button
            Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  onPressed: (){},
                  child: Text("Save"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 400,
                  height: 50,
                ))
          ],
        ),
      ),
    );
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
        title: Text("Education",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
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
}*/
class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  TextEditingController ?_unvirsityController;
  TextEditingController ?_titleController;
  TextEditingController ?_startController;
  TextEditingController ?_endController;

  Future<void> _selectDateFromPicker1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _startController?.text = "${picked.day}/ ${picked.month}/ ${picked.year}";

      });
  }
  Future<void> _selectDateFromPicker2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _endController?.text = "${picked.day}/ ${picked.month}/ ${picked.year}";

      });
  }
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }


  setDataToTextField(data){
    return  SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'University *',
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
                hintText: "write your university",
                  border: OutlineInputBorder()
              ),
              controller: _unvirsityController = TextEditingController(text: data['unvirsity']),
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Title*',
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
                  hintText: "write your title",
                  border: OutlineInputBorder()
              ),
              controller: _titleController = TextEditingController(text: data['title']),
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
            TextFormField(
              decoration: InputDecoration(
                hintText: "write your start year",
                  suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Iconsax.calendar_1),
                  ),
                  border: OutlineInputBorder()
              ),
              controller: _startController= TextEditingController(text: data['startyear']),
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'End Year*',
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
                hintText: "write your start year",
                  border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => _selectDateFromPicker2(context),
                  icon: Icon(Iconsax.calendar_1),
                ),
              ),
              controller: _endController = TextEditingController(text: data['endyear']),
            ),
            SizedBox(height: 25),
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
      ),
    );
  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          "unvisty":_unvirsityController!.text,
          "title":_titleController!.text,
          "startyear":_startController!.text,
          "endyear":_endController!.text,

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
        title: Text("Education",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
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


