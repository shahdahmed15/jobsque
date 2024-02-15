import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/widget/custom_phone_field.dart';
import 'package:jobsquee/profile/login_security/two_step4.dart';
import 'package:jobsquee/profile/profile.dart';

import '../../compant.dart';


class TwoStepVerification3 extends StatefulWidget {
  TwoStepVerification3({Key? key}) : super(key: key);

  @override
  State<TwoStepVerification3> createState() => _TwoStepVerification3State();
}

class _TwoStepVerification3State extends State<TwoStepVerification3> {
  TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
  TextEditingController passwordController=TextEditingController(text: '123456');
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
              'Add phone number',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 5),
            Text(
              'We will send a verification code to this number',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 10),
            CustomPhoneTextFormField(controller: phoneController),
            SizedBox(height: 10),
            Text(
              'Enter your password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            SizedBox(height: 5),
            defaultFormField1(
                isPassword : false,
                suffix: isPassword ? Icons.visibility_off : Icons.visibility,
                suffixPressed: (){
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                controller: passwordController,
                label: 'Password',
                prefix: Icons.lock_outline,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is Empty';

                  }
                }),
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
                    navigatorPage(context, TwoStepVerification4());},
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
////////////////////////////////////////////////////////
Widget defaultFormField1({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,

}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null ? IconButton( onPressed: suffixPressed , icon: Icon( suffix,),)  : null,
          border: OutlineInputBorder(),
        ),
      ),
    );

//////////////////////////////////////////////////////

