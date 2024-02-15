import 'package:flutter/material.dart';
class customButtom extends StatelessWidget {
  const customButtom({Key? key,this.text,this.onTap}) : super(key: key);
  final String?text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
              borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Text(text!,textAlign: TextAlign.center),

        ),
      ),
    );
  }
}


