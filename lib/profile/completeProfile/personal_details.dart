import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../Apply_Job/widget/custom_phone_field.dart';


class personal_details extends StatefulWidget {
  @override
  _personal_detailsState createState() => _personal_detailsState();
}

class _personal_detailsState extends State<personal_details> {
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
        title: Text("Personal_details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
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





/*class personal_details extends StatefulWidget {
  @override
  _personal_detailsState createState() => _personal_detailsState();
}

class _personal_detailsState extends State<personal_details> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? imageUrl;
  File? _image;
  String profilePicLink = "";

  Future<void> getimage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512, imageQuality: 90,);
    if (image != null) {
      _image = File(image.path);
      var image_name = basename(image.path);
      final Reference ref = _storage.ref(image_name);
      final UploadTask uploadTask = ref.putFile(_image!);
      final TaskSnapshot taskSnapshot = await uploadTask;
      imageUrl = await taskSnapshot.ref.getDownloadURL();
    }

  }

  Future<void> sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    if (user != null) {
      await _db.collection("users-form-data").doc(user.email).set({
        "name": _nameController.text,
        "phone": _phoneController.text,
        "bio":_bioController.text,
        "address":_addressController.text,
        "image_url": imageUrl,
      }).then((value) =>navigatorPage(context, Complete_Profile()));
    }
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
        title: Text("personal_details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<void>(
                future: getimage(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (imageUrl != null) {
                      return CircleAvatar(
                        radius: 66,
                        child: ClipRect(
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return CircleAvatar(
                        radius: 66,
                        backgroundImage: NetworkImage("https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png"),
                      );
                    }
                  }
                },
              ),


              TextButton(
                onPressed: () {
                  getimage();
                },
                child: Text("change image"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  TextFormField(controller: _nameController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "name ",
                    ) ,
                  ),
                  ///bio
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Bio',
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
                  TextFormField(controller: _bioController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "bio ",
                    ) ,
                  ),
                  ///address
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'address',
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
                  TextFormField( controller: _addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "address",



                    ),
                  ),
                  ///phone
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'phone',
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
                      controller: _phoneController),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
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
        ),
      ),
    );
  }
}*/