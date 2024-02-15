import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/profile/login_security/two_step3.dart';
import 'package:slide_switcher/slide_switcher.dart';

import '../../compant.dart';

class TwoStepVerification2 extends StatefulWidget {
  TwoStepVerification2({Key? key}) : super(key: key);

  @override
  State<TwoStepVerification2> createState() => _TwoStepVerification2State();
}

class _TwoStepVerification2State extends State<TwoStepVerification2> {
  int switcherIndex1 = 0;

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "Telephone number (SMS)",
        child: Text(
          'Telephone number (SMS)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,

          ),
        )),
    DropdownMenuItem(value: "Authenticator App",
        child: Text(
          'Authenticator App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,

          ),
        )),
  ];

  String selectedValue = "Telephone number (SMS)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,toolbarHeight: 70,elevation: 0,centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 20,
              icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
        ),
        title: Text("Two-step verification",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Secure your account with \ntwo-step verification",style: TextStyle(color: Colors.grey),),
                  SlideSwitcher(
                      children: [
                        Container(),
                        Container(),
                      ],
                      containerHeight: 30,
                      containerWight: 60,
                      isAllContainerTap: true,
                      onSelect: (int index) => setState(() => switcherIndex1 = index),
                      indents: 5,
                      containerColor:
                      switcherIndex1 == 0 ? Colors.grey : Colors.blue),
                ],
              ),
            ),


            SizedBox(height: 10),
            Text(
              'Select a verification method',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 13.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 9,),
            DropdownButtonFormField(
                icon: const Icon(Iconsax.arrow_down_14,color: Colors.black,),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color:Colors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),

                ),
                value: selectedValue,
                onChanged: (String? newValue) {

                  selectedValue = newValue!;

                },
                items: menuItems),
            SizedBox(height: 2),
            Text(
              'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
              style: TextStyle(

                color: Colors.grey,
                fontSize: 11.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue
                  ),
                  child: MaterialButton(onPressed: (){
                    navigatorPage(context, TwoStepVerification3());},
                    child: Text("Next",style: TextStyle(
                        color: Colors.white
                    ),),),
                ))

          ],
        ),
      ),
    );
  }
}