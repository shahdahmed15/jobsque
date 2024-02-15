import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/Apply_Job/type_of_work.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Bio_data.dart';
import 'Job_details.dart';
import 'job_cubit/cubit.dart';
import 'job_cubit/state.dart';

class JobApplicationBiodata extends StatefulWidget {
  const JobApplicationBiodata({super.key});

  @override
  State<JobApplicationBiodata> createState() => _JobApplicationBiodataState();
}

class _JobApplicationBiodataState extends State<JobApplicationBiodata> {

  @override
  void initState() {
    super.initState();
   // context.read<JobDetailsProvider>().clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 96,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.transparent,
                      height: 2,
                    ),
                    //! header
                    SizedBox(
                      height: 4,
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              iconSize: 20,
                              icon: const Icon(Iconsax.arrow_left4)),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Apply for Job",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ]),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    //! progress bar
                    SizedBox(
                      height: 100,
                      width: 90,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.cyanAccent,
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.cyanAccent,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Text("Biodata",
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.cyanAccent,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Divider(
                                color: Colors.transparent,
                                height: 3.5.h,
                              ),
                             // DottedSeparator(dotColor: AppColours.neutral400),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 3.h,
                    ),
                    //! biodata info
                    Text("Biodata",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    Divider(
                      color: Colors.transparent,
                      height: 1.h,
                    ),
                    Text(
                      "Fill in your bio data correctly",
                      style: TextStyle(
                          fontSize: 9.5.sp,
                          color:Colors.cyanAccent,
                          fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 2.h,
                    ),
                    //! name text field
                    Text.rich(TextSpan(
                      text: "Full Name",
                      style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: "*",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.w400))
                      ],
                    )),

                    //! email text field

                  ],
                ),
              ),
            ),
          )),
    );
  }}