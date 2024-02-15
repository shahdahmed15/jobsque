import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../compant.dart';
import 'login_security.dart';

class TwoStepVerification4 extends StatelessWidget {
  TwoStepVerification4({Key? key}) : super(key: key);

  OtpFieldController otpController = OtpFieldController();

  bool isPassword = true;

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
            Text(
              'Enter the 6 digit code',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 1),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Please confirm your account by entering the authorization code sen to ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.5,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                  TextSpan(
                    text: '****-****-7234',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.5,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: TextStyle(
                  color: const Color(0xFF222741),
                  fontSize: 12,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
            SizedBox(height: 2),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                    ),
                    onPressed: (){}, child: Text("Resend Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),
                )),
                SizedBox(width: 1),
                Text("42s",
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 13.5,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,

                  ),
                ),
              ],
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
                    navigatorPage(context, LoginAndSecurityScreen());},
                    child: Text("Verify",style: TextStyle(
                        color: Colors.white
                    ),),),
                ))




          ],
        ),
      ),

    );
  }
}