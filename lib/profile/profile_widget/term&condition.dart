import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/profile/profile.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(onPressed: (){
              navigatorPage(context, profile_screen());
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            SizedBox(width: 50,),
            Text("Terms & Conditions",style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all( 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 5),
              Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: 9),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 144,
                padding:  EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                decoration: const BoxDecoration(color:Colors.blueGrey),
                child: Text(
                  'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}