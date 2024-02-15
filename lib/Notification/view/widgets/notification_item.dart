import 'package:flutter/material.dart';
import '../../model/notificationModel.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.img), radius: 21),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notification.company,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              notification.status
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                notification.datetime,
                style:  TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              )
            ],
          ),
        ],
      ),
      subtitle: Text(
        notification.subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style:  TextStyle(
          color: Colors.grey,
          fontSize: 10,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
      ),
      contentPadding:EdgeInsets.zero,

    );
  }
}