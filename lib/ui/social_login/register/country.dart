import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_switcher/slide_switcher.dart';

import '../../../compant.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/state.dart';
import 'AccountCreated.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<String> selectedChoices = [];
  int switcherIndex2 = 0;

  List<Map<String, dynamic>> choices = [
    {
      'label': 'india',
      'image': AssetImage('assets/images/img_1.png'),
    },
    {
      'label': 'Singapore',
      'image': AssetImage('assets/images/img_2.png'),
    },
    {
      'label': 'Philipines',
      'image': AssetImage('assets/images/img_3.png'),
    },
    {
      'label': 'England',
      'image': AssetImage('assets/images/img_4.png'),
    },
    {
      'label': 'Canada',
      'image': AssetImage('assets/images/img_5.png'),
    },
    {
      'label': 'Malaysia',
      'image': AssetImage('assets/images/img_6.png'),
    },
    {
      'label': 'Argentina',
      'image': AssetImage('assets/images/img_7.png'),
    },
    {
      'label': 'Indonesia',
      'image': AssetImage('assets/images/img_8.png'),
    },
    {
      'label': 'Saudi arabia',
      'image': AssetImage('assets/images/img_9.png'),
    },
    {
      'label': 'China',
      'image': AssetImage('assets/images/img_10.png'),
    },
    {
      'label': 'Brazil',
      'image': AssetImage('assets/images/img_11.png'),
    },
    {
      'label': 'United States',
      'image': AssetImage('assets/images/img_12.png'),
    },
    {
      'label': 'Vietnam',
      'image': AssetImage('assets/images/img_13.png'),
    },
    // Add more choices as needed
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAuthState>(
      listener: (context,state){},
        builder: (context,state){
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 80,left: 20),
                    child: Text("What type of work are you interested in?",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),

                  ) ,
                  SizedBox(height: 5,),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Tell us what you’re interested in so we can customise the app for your needs.",style: TextStyle(color: Colors.grey,fontSize: 14))),
                  SizedBox(height: 5,),
                  SlideSwitcher(
                    children: [
                      Text(
                        'Work from office',
                        style: TextStyle(
                          fontWeight:
                          switcherIndex2 == 0 ? FontWeight.w500 : FontWeight.w400,
                          color:
                          switcherIndex2 == 0 ? Colors.blue : Colors.white,
                        ),
                      ),
                      Text(
                        'Remote work',
                        style: TextStyle(
                          fontWeight:
                          switcherIndex2 == 1 ? FontWeight.w500 : FontWeight.w400,
                          color:
                          switcherIndex2 == 1 ?Colors.blue : Colors.white,
                        ),
                      ),
                    ],
                    containerColor: Colors.grey.shade300,
                    onSelect: (int index) => setState(() => switcherIndex2 = index),
                    containerHeight: 40,
                    containerWight: 350,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 300),
                    alignment: Alignment.centerLeft,
                      child: Text("Select the country you want for your job")),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: choices.map((choice) {
                      return Container(
                        child: ChoiceChip(
                          selectedColor: Colors.cyan[100],
                          disabledColor: Colors.grey[100],
                          label: Text(choice['label']),
                          labelPadding: EdgeInsets.all(10),
                          avatar: CircleAvatar(
                            backgroundImage: choice['image'],
                          ),
                          selected: selectedChoices.contains(choice['label']),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedChoices.add(choice['label']);
                              } else {
                                selectedChoices.remove(choice['label']);
                              }
                            });
                          },
                        ),

                      );
                    }).toList(),

                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 700,left: 20,right: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue
                ),
                child: MaterialButton(
                  onPressed: (){
                    navigatorPage(context, AccountCreated());

                  },
                  child: Text("Next",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                  ),
                ),

              )



            ],
          ),
        );
        },

    );
  }
}
