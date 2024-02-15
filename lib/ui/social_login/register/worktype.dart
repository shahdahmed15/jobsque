import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../compant.dart';
import '../../../shared/cubit/auth_cubit.dart';
import '../../../shared/cubit/state.dart';
import 'country.dart';
class WorkType extends StatefulWidget {
  const WorkType({super.key});

  @override
  State<WorkType> createState() => _WorkTypeState();
}

class _WorkTypeState extends State<WorkType> {
  List<String> selectedChoices = [];
  List <work>workTypeList = [
    work(Iconsax.bezier, "UI/UX Designer", true),
   work(Iconsax.pen_tool,"Illustrator Designer",false),
    work(Iconsax.code,"Developer",false),
    work(Iconsax.graph,"Management",false),
    work(Iconsax.monitor_mobbile,"Information Technology",false),
    work(Iconsax.cloud_add,"Research and Analytics",true),


  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,SocialAuthState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 130,
              title: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    'What type of work are you interested in?',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tell us what you’re interested in so we can customise the app for your needs.',
                    maxLines: 2,
                    style: TextStyle(
                      color: const Color(0xFF737379),
                      fontSize: 15,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child:/*GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             mainAxisSpacing : 7,
                             crossAxisSpacing : 7.0,
                             childAspectRatio : 1.3,
                            crossAxisCount:2,
                          ),
                          itemCount: cubit.jobCardList.length,
                          itemBuilder: (context,index)=>
                      )*/
                      GridView.count(
                          crossAxisCount: 2,
                          children: workTypeList.map(
                                  (e) => Card(
                                    color:e.isActive? Colors.cyan[100]:Colors.grey[100],
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                      decoration: ShapeDecoration(
                                        color:e.isActive? Colors.white:Colors.grey[100],
                                  shape: RoundedRectangleBorder(
                                  side: const BorderSide( color: Colors.blue),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                  ),
                                      child: Icon(e.icon,color: e.isActive? Colors.blue:Colors.black,size: 40,)),
                                      SizedBox(height: 3,),
                                      Text(e.title,style: TextStyle(fontSize: 15,color: Colors.black),)
                                    ],
                                  ),
                                ),
                              )
                          ).toList()
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              navigatorPage(context, Location());},child: Text("Next",style: TextStyle(color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                          ),
                        )
                    )
                  ],
                ),
              ),
            )


             );
        },
    );
  }

}

class work{
  final IconData icon;
  final String title;
  bool isActive=false;
  work(
  this.icon, this.title, this.isActive
  );
}


