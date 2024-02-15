import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import '../../widget/custom_search.dart';
import '../model/message_item.dart';
import '../model/message_model.dart';
import 'message_empty.dart';


class MessagesScreen extends StatelessWidget {
  MessagesScreen({Key? key}) : super(key: key);
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Message",style: TextStyle(color: Colors.black)),elevation: 0.0,centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomSearchBar(
                    controller: searchController, hintText: 'Search messages....',

                  ),
                ),
                SizedBox(width: 3),
                Column(
                  children: [
                    IconButton(onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)
                            )
                          ),
                          builder: ((context){
                            return Container(
                              height: 300,
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(alignment: Alignment.topLeft,child: Text("Message filters"),),
                                    GestureDetector(
                                      onTap: (){navigatorPage(context, MessageEmptyScreen());},
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:double.maxFinite,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextButton(onPressed: (){
                                          navigatorPage(context, MessageEmptyScreen());
                                        }, child: Text("Read",style: TextStyle(color: Colors.black),)),Icon(Icons.arrow_forward)],)
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    GestureDetector(
                                      onTap: (){navigatorPage(context, MessageEmptyScreen());},
                                      child: Container(
                                          alignment: Alignment.center,
                                          width:double.maxFinite,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextButton(onPressed: (){}, child: Text("Spam",style: TextStyle(color: Colors.black),)),Icon(Icons.arrow_forward)],)
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    GestureDetector(
                                      onTap: (){navigatorPage(context, MessageEmptyScreen());},
                                      child: Container(
                                          alignment: Alignment.center,
                                          width:double.maxFinite,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextButton(onPressed: (){}, child: Text("Archived",style: TextStyle(color: Colors.black),)),Icon(Icons.arrow_forward)],)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );


                          })

                      );

                    },
                        icon: Container(

                            //padding: const EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide( color: Colors.grey),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ) ,child: Icon(Iconsax.setting_4))),
                  ],
                )

              ],
            ),
            SizedBox(height: 3,),
            GestureDetector(
              onTap: (){
                navigatorPage(context, MainPageState());
              },
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) =>
                    MessageItem(messages[index]),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}