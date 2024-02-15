
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/Job_details.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/saved/save_job.dart';


Widget buildbutton({
  required Color color,
  required String text,
  bool isUpper = true,
  required Function function,
}) => Container(
    width: 65,
    height: 20,
    decoration: ShapeDecoration(
      color:  Colors.cyan[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Center(
      child: Text(text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 10,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
    )
);

class Recent_Job extends StatefulWidget {
  const Recent_Job({Key? key}) : super(key: key);

  @override
  State<Recent_Job> createState() => _Recent_JobState();
}

class _Recent_JobState extends State<Recent_Job> {

  List _JOB=[];
  var _firestoreInstance = FirebaseFirestore.instance;

  var job;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("job").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _JOB.add({
          "image": qn.docs[i]["image"],
          "price": qn.docs[i]["price"],
          "email": qn.docs[i]["email"],
          "web_site": qn.docs[i]["web_site"],
          "company": qn.docs[i]["company"],
          "location": qn.docs[i]["location"],
          "com_des": qn.docs[i]["com_des"],
          "name": qn.docs[i]["name"],
          "skills": qn.docs[i]["skills"],
          "job_des": qn.docs[i]["job_des"],
        });
      }
    });

    return qn.docs;
  }

  addToFavorites(job) async {
    await _firestoreInstance.collection("users_favourite_items").add(job);
  }


  @override
  void initState(){
    fetchProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.separated(
            itemBuilder: (BuildContext context,int index){
              return GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>job_details (_JOB[index])));
               },
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width:100,
                          height: 100,
                          decoration: ShapeDecoration(

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child:Image.network(_JOB[index]["image"])
                      ),
                      title: Text(
                        "${_JOB[index]["name"]}",
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
                            "${_JOB[index]["company"]}•",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${_JOB[index]["location"]}",
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
                      trailing: IconButton(
                          onPressed: () {
                            addToFavorites(_JOB[index]);
                          },

                          icon:Icon(Iconsax.archive_minus)
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildbutton(color: Colors.blue, text: 'Full time', function: (){}),
                        buildbutton(color: Colors.blue, text: 'Remote', function: (){}),
                        buildbutton(color: Colors.blue, text: 'Senior', function: (){}),
                        Spacer(),
                        Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${_JOB[index]["price"]}\$",
                                    // text: '\$20',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: 'SFProDisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/Month',
                                    style: TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 10,
                                      fontFamily: 'SFProDisplay',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )


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
            itemCount: _JOB.length
        )
    );
  }
}