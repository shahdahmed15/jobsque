import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key,this.title,this.subtitle,this.image}) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? image;


  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Column(
          children: [
            Container(
              child:Image.asset(image!,fit: BoxFit.contain,alignment: Alignment.center),

            ),
            SizedBox(height: 5,),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title!,style : TextStyle(
                  fontSize : 32,
                  color : Color(0xFF111827),

                ),
                    textAlign: TextAlign.left),
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(subtitle!,style:TextStyle(color: Colors.grey),textAlign: TextAlign.left),
            )
          ],
        )
      ],
    );
  }
}








