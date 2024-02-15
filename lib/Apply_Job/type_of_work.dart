import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/uploadPortoflio.dart';
import 'package:jobsquee/compant.dart';

import 'job_cubit/cubit.dart';
class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({super.key});

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=JobCubit.get(context);
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
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
                            "2",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
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
                ),
                Container(
                  //width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(width: 40,),
                      Text("Biodata",style: TextStyle(color: Colors.blue,fontSize: 10),),
                      SizedBox(width: 80,),
                      Text("Type of work",style: TextStyle(color: Colors.blue,fontSize: 10),),
                      SizedBox(width: 40,),
                      Text("Upload portfolio",style: TextStyle(color: Colors.blue,fontSize: 10),),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Text(
              'Type Of Work',
              style: TextStyle(
                color:Colors.black,
                fontSize: 20,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w900,

              ),
            ),
            Text(
              'Fill in your bio data correctly',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 3),
            Column(
              children: cubit.typeOfWorkTiles,
            ),

            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
navigatorPage(context, upload_portflio());
                },
                child:Text('Next'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 400,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}