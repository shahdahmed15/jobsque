import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Notification/view/widgets/notification_item.dart';

import '../model/notificationModel.dart';
import 'notification_empty.dart';



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    iconSize: 20,
                    icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
              ),
              SizedBox(width: 10,),
              Text("Notification",style: TextStyle(color: Colors.black),),
            ],
          )),
      body: !isEmpty
          ? SingleChildScrollView(
          child: Column(
            children: [
              Container(
          padding: EdgeInsets.only(left: 10,top: 5),
        color: Colors.grey[350],
        width: double.infinity,
        height: 30,
        child: Text("News ",style: TextStyle(color: Colors.grey,fontSize: 15),),
      ),
              SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(notifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 5),
                color: Colors.grey[350],
                width: double.infinity,
                height: 30,
                child: Text("Yesturday ",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: yesterdayNotifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(yesterdayNotifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
            ],
          ))
          : NotificationEmptyScreen(),
    );
  }
}