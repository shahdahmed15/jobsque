import 'package:flutter/material.dart';

import 'message_model.dart';


class MessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const MessageItem(this.messageModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.topLeft,
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(messageModel.img), radius: 21),
          messageModel.status?
          SizedBox():
          Container(
            width: 4,
            height: 2,
            decoration: ShapeDecoration(
              color: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
            ),
          )
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            messageModel.name,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),

          Text(
            messageModel.datetime,
            style:  TextStyle(
              color: messageModel.status? Colors.black: Colors.blue,
              fontSize: 10,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          ),
        ],
      ),
      subtitle: Text(
        messageModel.message,
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