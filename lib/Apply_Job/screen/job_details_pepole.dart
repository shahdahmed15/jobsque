import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/job_details_peopleTile.dart';



class JobDetailsPepole extends StatelessWidget {
  JobDetailsPepole({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "UI/UX Designer",
        child: Text(
          'UI/UX Designer',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        )),
    DropdownMenuItem(value: "Front",
        child: Text(
          'Front',
          style: TextStyle(
            color:  Colors.grey,
            fontSize: 10,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,

          ),
        )),
  ];

  String selectedValue = "UI/UX Designer";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '3 Employees For',
                style: TextStyle(
                  color:  Colors.black,
                  fontSize: 14,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
              subtitle: Text(
                'UI/UX Design',
                style: TextStyle(
                  color:  Colors.grey,
                  fontSize: 12,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              ),

              trailing:  SizedBox(
                width: 180,


                child: DropdownButtonFormField(
                    padding: EdgeInsets.all(0),
                    icon:  Icon(Iconsax.arrow_down_14,color: Colors.grey,size: 14),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color:  Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color:  Colors.grey),
                      ),

                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {

                      selectedValue = newValue!;

                    },
                    items: menuItems),
              ),
            ),
            SizedBox(height: 3),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=> JobDetailsPeopleTile(
                    image:"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR",
                    name: "Dimas Adi Saputro",
                    job: "Senior UI/UX Designer at Twitter",
                    yearsOfExp: "5 Years"),

                separatorBuilder: (context,index)=>const Divider(),
                itemCount: 5
            ),
          ],
        ),
      ),
    );
  }
}