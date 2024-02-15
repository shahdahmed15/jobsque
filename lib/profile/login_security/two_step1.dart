import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/profile/login_security/two_step2.dart';
import 'package:slide_switcher/slide_switcher.dart';
class TwoStepVerification1 extends StatefulWidget {
  TwoStepVerification1({Key? key}) : super(key: key);

  @override
  State<TwoStepVerification1> createState() => _TwoStepVerification1State();
}

class _TwoStepVerification1State extends State<TwoStepVerification1> {
  TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
  int switcherIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        padding: const EdgeInsets.all( 24.0),
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


            SizedBox(height: 10,),
            const TwoStepVerificationTile(icon: Iconsax.sms, text: "Two-step verification provides additional security by asking for a verification code every time you log in on another device."),
            SizedBox(height: 5,),
            const TwoStepVerificationTile(icon: Iconsax.external_drive, text: "Adding a phone number or using an authenticator will help keep your account safe from harm."),

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
                    navigatorPage(context, TwoStepVerification2());},
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
//////////////////////////////////////////////////////////////////////////
class TwoStepVerificationTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const TwoStepVerificationTile({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height:50,
        decoration: const ShapeDecoration(
          color: Colors.cyan,
          shape: CircleBorder(),
        ),
        child: Center(child: Icon(icon,color: Colors.blue[900],)),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11.5,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}