
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/search/search_list.dart';
import 'package:jobsquee/search/search_screen.dart';
import 'package:jobsquee/shared/cubit/auth_cubit.dart';
import 'package:jobsquee/shared/cubit/cubit.dart';
import 'package:jobsquee/shared/cubit/state.dart';
import 'package:jobsquee/ui/social_login/login/login/login.dart';

import '../../Notification/view/notification_screen.dart';
import '../widget/Recent_Job.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ?_nameController;
  setDataToTextField(data){
    return TextFormField(
      style: TextStyle(fontWeight: FontWeight.w600),
      decoration: InputDecoration( border: InputBorder.none,),
      controller: _nameController = TextEditingController(text: "Hi, ${data['name']}👋",),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialAuthState>(
        listener: (context,state){},
        builder: (context,state){
      return Scaffold(
       appBar:AppBar(
         elevation: 0,
         backgroundColor: Colors.transparent,
         toolbarHeight: 100,
         title: ListTile(
           title: StreamBuilder(
             stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
             builder: (BuildContext context, AsyncSnapshot snapshot){
               var data = snapshot.data;
               if(data==null){
                 return Center(child: CircularProgressIndicator(),);
               }
               return setDataToTextField(data);
             },

           ),
           subtitle: Text("Create a better future for yourself here",style: TextStyle(color: Colors.grey),),
         ),
         actions: [
           InkWell(
             onTap: () {
               navigatorPage(context, NotificationScreen());
             },
             child: const Padding(
               padding: EdgeInsets.only(left: 10,right: 10),
               child: CircleAvatar(
                 backgroundColor: Colors.transparent,
                 child: Icon(
                   color:Colors.black,
                   Iconsax.notification,
                   size: 30,
                 ),
               ),
             ),
           ),
         ],
       ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///search
              GestureDetector(
                onTap: ()=>navigatorPage(context, SearchList()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        //  navigatorPage(context, LoginScreen());
                      }, icon: Icon(Iconsax.search_normal),),
                      Text("Search.....",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ///suggest job
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Suggested Job",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    Text("View all",style: TextStyle(color: Colors.blue),)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('assets/images/Zoom Job.png'),
                      SizedBox(width: 3,),
                      Image.asset('assets/images/Zoom Job.png'),
                      SizedBox(width: 3,),
                      Image.asset('assets/images/Zoom Job.png')


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ///Recent job
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Job",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                    TextButton(onPressed: (){navigatorPage(context, Recent_Job());
                    },child:Text("View all",style: TextStyle(color: Colors.blue)),)
                  ],
                ),
              ),

              Expanded(child: Recent_Job())
            ],
          ),
        )
      );
    }
    );
  }
}








