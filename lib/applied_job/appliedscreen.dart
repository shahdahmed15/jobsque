import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/layout/TheMaster.dart';
import 'package:jobsquee/profile/completeProfile/education.dart';

import 'fetchProduct.dart';

class Applied_Screen extends StatefulWidget {
  @override
  _Applied_ScreenState createState() => _Applied_ScreenState();
}

class _Applied_ScreenState extends State<Applied_Screen> {
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
        title: Text("Applied Job",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),

      body: SafeArea(
        child: fetchData("users-cart-items")
      ),

    );
  }
}



