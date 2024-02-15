import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/Job_details.dart';
import 'package:jobsquee/applied_job/appliedscreen.dart';
import 'package:jobsquee/home/screen/Home.dart';
import 'package:jobsquee/layout/TheMaster.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../compant.dart';









class upload_portflio extends StatefulWidget {
  const upload_portflio({Key? key}) : super(key: key);

  @override
  State<upload_portflio> createState() => _upload_portflioState();
}

class _upload_portflioState extends State<upload_portflio> {
  String url="";
  int? number;
  uploadData()async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;
    ///generate random number
    number=Random().nextInt(10);
    ///pick file
    FilePickerResult? result=await FilePicker.platform.pickFiles();
    File pick=File(result!.files.single.path.toString());
    var file=pick.readAsBytesSync();
    String name=DateTime.now().microsecondsSinceEpoch.toString();
    ///upload file to firebase
    var pdfFile=FirebaseStorage.instance.ref(FirebaseAuth.instance.currentUser!.email).child(name).child("/.pdf");
    UploadTask task=pdfFile.putData(file);
    TaskSnapshot snapshot=await task;
    url=await snapshot.ref.getDownloadURL();
    ///upload url to cloud firebase
    await FirebaseFirestore.instance.collection("files").doc(currentUser!.email).set({
      "fileUrl":url,
      "num":"Pdf"+number.toString()

    });
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child:
             Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   SizedBox(width: 50,),
                   CircleAvatar(
                     radius: 35,
                     child: Icon(Icons.check_rounded,color: Colors.white,size: 40,),
                   ),
                   SizedBox(width: 50,),
                   CircleAvatar(
                     radius: 35,
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
                         "3",
                         style: TextStyle(fontSize: 30),
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: [
                   SizedBox(width: 60,),
                   Text("Biodata",style: TextStyle(color: Colors.blue,fontSize: 10),),
                   SizedBox(width: 80,),
                   Text("Type of work",style: TextStyle(color: Colors.blue,fontSize: 10),),
                   SizedBox(width: 50,),
                   Text("Upload portfolio",style: TextStyle(color: Colors.blue,fontSize: 10),),

                 ],
               ),
               SizedBox(height: 10,),
               Text(
                 'Upload portfolio',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontFamily: 'SFProDisplay',
                   fontWeight: FontWeight.w700,

                 ),
               ),
               SizedBox(height: 10,),
               Text(
                 'Fill in your bio data correctly',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 15,
                   fontFamily: 'SFProDisplay',
                   fontWeight: FontWeight.w400,

                 ),
               ),
             ],
           )
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("files").snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,i){
                        QueryDocumentSnapshot x=snapshot.data!.docs[i];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>View(url: x['fileUrl'],)));

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Upload CV',
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
                              SizedBox(height: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.picture_as_pdf,color: Colors.red,size: 40,),
                                  title: Text('${x['num']}.cv'),
                                  subtitle: Text("cv.pdf"),
                                   trailing: IconButton(onPressed: (){
                                   FirebaseFirestore.instance.collection("files").doc(x.id).delete();

                                   },icon: Icon(Icons.close_sharp,color: Colors.red),),
                              )
                              )
                            ],
                          ),
                        );
                      },


                    ),
                  );

                }
                return Center(child: CircularProgressIndicator(),);
              },

            ),
            Text("Other File"),
            SizedBox(height: 10,),
            Expanded(child: Center(
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [10,10],
                color: Colors.blue,
                child: Container(
                  height: 200,width: 400,
                  decoration: BoxDecoration(color: Colors.cyan[50],borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height:20),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.cyan[100],
                        child: Icon(
                          Iconsax.document_upload5,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      SizedBox(height:10),
                      Text("Upload your file", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      SizedBox(height:10),
                      Text("Max file size 10 MB", style: TextStyle(fontSize: 9.5, color: Colors.grey, fontWeight: FontWeight.w400),),
                      SizedBox(height:20),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(color: Colors.blue),
                            backgroundColor: Colors.cyan[50],
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: ()  {
                            uploadData();
                          },
                          icon: Icon( Iconsax.export_1),
                          label: Text('Add file'),
                        ),
                      ),


                    ],
                  ),

                ),

              )
            )
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  navigatorPage(context, Applied_Screen());

                },
                child:Text('Submit'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 400,
                height: 50,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        uploadData();
      },
        child:Icon(Icons.add) ,
      ),
    );

  }
}

class View extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final url;
  View({this.url});

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
        title: Text("Pdf View",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,



      ),
    );
  }
}