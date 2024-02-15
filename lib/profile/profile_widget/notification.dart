import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobsquee/profile/profile.dart';
import 'package:slide_switcher/slide_switcher.dart';
import '../../compant.dart';

class Notification_Setting extends StatefulWidget {
  const Notification_Setting({Key? key}) : super(key: key);

  @override
  State<Notification_Setting> createState() => _Notification_SettingState();
}

class _Notification_SettingState extends State<Notification_Setting> {
  bool val1=true;
  onChangeMethod1(bool newVal1){setState(() {
    val1=newVal1;
  });}
  bool val2=true;
  onChangeMethod2(bool newVal2){
    setState(() {
      val1=newVal2;
    });
  }
  bool val3=false;
  onChangeMethod3(bool newVal3){
    setState(() {
      val3=newVal3;
    });
  }
  bool val4=true;
  onChangeMethod4(bool newVal4){
    setState(() {
      val4=newVal4;
    });
  }
  bool val5=true;
  onChangeMethod5(bool newVal5){
    setState(() {
      val5=newVal5;
    });
  }
  bool val6=true;
  onChangeMethod6(bool newVal6){
    setState(() {
      val6=newVal6;
    });
  }
  bool val7=true;
  onChangeMethod7(bool newVal7){
    setState(() {
      val7=newVal7;
    });
  }
  bool val8=true;
  onChangeMethod8(bool newVal8){
    setState(() {
      val8=newVal8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 70,
            title: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                Text("Notification",style: TextStyle(color: Colors.black),)
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,top: 5),
                color: Colors.grey[350],
                width: double.infinity,
                height: 30,
                child: Text("Job notification ",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ),
              customSwitch('Your Job Search Alert', val1, onChangeMethod1),
              Divider(),
              customSwitch('Job Application Update', val2, onChangeMethod2),
              Divider(),
              customSwitch('Job Application Reminders', val3, onChangeMethod3),
              Divider(),
              customSwitch('Jobs You May Be Interested In', val4, onChangeMethod4),
              Divider(),
              customSwitch('Job Seeker Updates', val5, onChangeMethod5),
              Divider(),
              Container(
                padding: EdgeInsets.only(left: 10,top: 5),
                color: Colors.grey[350],
                width: double.infinity,
                height: 30,
                child: Text("Other notification  ",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ),
              customSwitch('Your Job Search Alert', val6, onChangeMethod6),
              Divider(),
              customSwitch('Job Application Update', val7, onChangeMethod7),
              Divider(),
              customSwitch('Job Application Reminders', val8, onChangeMethod8),

            ],
          ),
        )
    );
  }
}

Widget customSwitch(String text,bool val,Function onChangeMethod){
  return Padding(
    padding: EdgeInsets.only(top: 22,right: 16,left: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(
            fontSize: 13,
            color: Colors.black

        )),
        Spacer(),
        CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Colors.blue,
            value: val, onChanged: (newVal){
          onChangeMethod(newVal);
        })
      ],
    ),
  );
}
