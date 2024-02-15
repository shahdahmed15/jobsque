import 'package:flutter/material.dart';
Widget defaultFormField({
  required String labelName,
  TextEditingController? controller,
  TextInputType? type,
  Function? validate,
  Function? onChange,
  Function? submitField,
  Function? onpressIcon,
  IconData? iconData,
  IconData? suffix,
  IconData? prefix,
  bool obscureTextPassword = false,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        // onFieldSubmitted: (value) => submitField!(value),
        obscureText: obscureTextPassword,
        validator: (value) => validate!(value),
        // onChanged: (value) => changeVal!(value),
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                suffix,
               // color: Colors.cyan.shade800,
              ),
              onPressed: () => onpressIcon!()),
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
            ),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,

          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          hintText: labelName,
        ),
      ),
    );
navigatorPage(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);