import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/search/search_screen.dart';
import 'package:jobsquee/widget/custom_search.dart';

class SearchList extends StatelessWidget {
   SearchList({Key? key}) : super(key: key);
  var _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:35),
          child: Column(

            children: [
              GestureDetector(
                onTap: (){navigatorPage(context, SearchScreen());},
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 20,
                          icon: const Icon(Iconsax.arrow_left4)),
                    ),
                    Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                          }, icon: Icon(Iconsax.search_normal,color: Colors.grey,),),
                          Text("Type something...",style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.only(left: 10,top: 5),
                color: Colors.grey[350],
                width: double.infinity,
                height: 30,
                child: Text("Rercent Searches ",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ),
              Column(
                children: [
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("Junior UI Designer"),),
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("Junior UX Designer"),),
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("Product Designer"),),
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("Project Manager"),),
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("UI/UX Desiginer"),),
                  ListTile(leading: Icon(Iconsax.clock),trailing:Icon(Iconsax.close_circle,color: Colors.red,) ,title: Text("Front End Developer"),),
                  Container(
                    padding: EdgeInsets.only(left: 10,top: 5),
                    color: Colors.grey[350],
                    width: double.infinity,
                    height: 30,
                    child: Text("Popular searches ",style: TextStyle(color: Colors.grey,fontSize: 15),),
                  ),
                  ListTile(leading: Icon(Iconsax.search_favorite),trailing:Icon(Iconsax.arrow_circle_right,color: Colors.blue,) ,title: Text("UI/UX Desiginer"),),
                  ListTile(leading: Icon(Iconsax.search_favorite),trailing:Icon(Iconsax.arrow_circle_right,color: Colors.blue,) ,title: Text("Popular Searches"),),
                  ListTile(leading: Icon(Iconsax.search_favorite),trailing:Icon(Iconsax.arrow_circle_right,color: Colors.blue,) ,title: Text("Product Designer"),),
                  ListTile(leading: Icon(Iconsax.search_favorite),trailing:Icon(Iconsax.arrow_circle_right,color: Colors.blue,) ,title: Text("UX Desiginer"),),
                  ListTile(leading: Icon(Iconsax.search_favorite),trailing:Icon(Iconsax.arrow_circle_right,color: Colors.blue,) ,title: Text("Front End Developer"),),


                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
