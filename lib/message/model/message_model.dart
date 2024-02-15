import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/message/screens/message_screen.dart';
class MessageModel {
  final String img;
  final String name;
  final String message;
  final String datetime;
  final bool status;

  MessageModel({
    required this.name,
    required this.img,
    required this.message,
    required this.datetime,
    required this.status,
  });
}

List<MessageModel> messages = [
  MessageModel(
    name: 'Dana',
    img:
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTc7JDOG8MO0FUyZdhgbwPbDgVff2AzQeAY2Sjd96snS5mcJGLm',
    message: 'Here is the link: http://zoom.com/abcdeefg',
    datetime: '10.00AM',
    status: false,
  ),
  MessageModel(
    name: 'Shoope',
    img:
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlpvuEUiDglno6-RRq3yS21pjWaHiCllp5DfgG3rqrGK2y1gUL',
    message: 'Let’s keep in touch.',
    datetime: '10.00AM',
    status: false,
  ),
  MessageModel(
    name: 'Slack',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5OLpOAHVsss-Ygb0L4xKB72sVfmy34pC1OMMhdgeTCiCUDUmh',
    message: 'Thank You David!',
    datetime: '09.45',
    status: true,
  ),
  MessageModel(
    name: 'Facebook',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR82yd3z3FYgoKtPhHd8sdgXjHgxAn58OgblVy53FqgohTRHRKF',
    message: 'Thank you for your attention!',
    datetime: '10.00AM',
    status: false,
  ),
];


//////////////////////////////////////////////////
class Message{
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
    

});
}

class MainPageState extends StatefulWidget {
  const MainPageState({Key? key}) : super(key: key);

  @override
  State<MainPageState> createState() => _MainPageStateState();
}

class _MainPageStateState extends State<MainPageState> {
  List<Message>messages=[
    Message(text: "hi", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),
    Message(text: "hello", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: true),
    Message(text: "my name is shahd", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),
    Message(text: "i am ahmed", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: true),
    Message(text: "what do you do", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),
    Message(text: "fine, and u", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: true),
    Message(text: "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),
    Message(text: "Hi Melan, thank you for\n considering me, this is good news for me.", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: true),
    Message(text: "Can we have an\n interview via google meet \ncall today at 3pm?", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),
    Message(text: "Of course, I can!Of course, I can!", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: true),
    Message(text: "Ok, here I put the google meet link\n for later this afternoon.\n I ask for the timeliness, thank you! https://meet.google.com/dis-sxdu-ave", date: DateTime.now().subtract(Duration(days:3,minutes: 1)), isSentByMe: false),






  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          children: [
            IconButton(onPressed: (){navigatorPage(context, MessagesScreen());},
                icon: Icon(Icons.arrow_back,color: Colors.black,),
            ),
            SizedBox(width: 5,),
            CircleAvatar(radius: 20,child: Image.asset("assets/images/twitter.png"),),
            SizedBox(width: 5,),
            Text("twitter",style:TextStyle(color: Colors.black),)

          ],
        ),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
                builder:((context){
                  return Container(
                    //height: 300,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width:double.maxFinite,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            child: ListTile(leading: Icon(Iconsax.briefcase),title: Text("visit job post"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.center,
                            width:double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListTile(leading: Icon(Iconsax.note),title: Text("View my application"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.center,
                            width:double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListTile(leading: Icon(Icons.email),title: Text("Mark as unread"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.center,
                            width:double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListTile(leading: Icon(Iconsax.notification),title: Text("Mute"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.center,
                            width:double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListTile(leading: Icon(Iconsax.archive),title: Text("Archive"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.center,
                            width:double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListTile(leading: Icon(Icons.delete_outline),title: Text("Delete conversation"),trailing:Icon(Icons.arrow_forward_ios) ),
                          ),

                        ],
                      ),
                    ),
                  );
                })
            );
          }, icon: Icon(Iconsax.more,color: Colors.black,))
        ],
      ),

      body: Container(
        color: Colors.grey[500],
        child: Column(
          children: [
            Expanded(child: GroupedListView<Message,DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (messages)=>DateTime(
                messages.date.year,
                  messages.date.month,
                  messages.date.day
              ),
              groupHeaderBuilder: (Message messages)=>SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(messages.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context,Message messages)=>Align(
                alignment: messages.isSentByMe
                    ?Alignment.centerRight
                    :Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(messages.text),
                  ),
                ),
              ),

            )
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  // Handle button press
                },
                splashColor: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Iconsax.paperclip),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      Icon(Iconsax.microphone),
                    ],
                  ),
                ),
              ),
              /*child:Row(
                children: [
                //  Icon(Iconsax.paperclip),
                //  SizedBox(width: 2,),

                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                    ),
                  )

                ],
              ) ,*/
              /*color: Colors.grey,
              child:TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  hintText: 'write the message....',
                ),
              ),*/

            )

          ],
        ),
      ),
    );
  }
}
