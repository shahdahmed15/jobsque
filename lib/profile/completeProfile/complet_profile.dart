import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/profile/completeProfile/personal_details.dart';
import 'package:jobsquee/profile/completeProfile/portflio.dart';

import 'education.dart';
import 'experince.dart';
class Complete_Profile extends StatefulWidget {
  const Complete_Profile({Key? key}) : super(key: key);

  @override
  State<Complete_Profile> createState() => _Complete_ProfileState();
}

class _Complete_ProfileState extends State<Complete_Profile> {
  bool isFavourte = false;
  @override
  void initState(){
    super.initState();
  }
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
        title: Text("Complete Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CircleProgressBar(),
            GestureDetector(
              onTap:() =>navigatorPage(context, personal_details()),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color:  isFavourte ? Colors.cyan[50] : Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Personal Details",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text("Full name, email, phone number, and your address",style: TextStyle(color: Colors.grey),),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap:() =>navigatorPage(context, Education()),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Education",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text("Enter your educational history to be considered by the recruiter",style: TextStyle(color: Colors.grey),),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap:() =>navigatorPage(context, Experience_screen()),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Experience",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text("Enter your work experience to be considered by the recruiter",style: TextStyle(color: Colors.grey),),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap:() =>navigatorPage(context, Portflio()),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Portfolio",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text("Create your portfolio. Applying for various types of jobs is easier.",style: TextStyle(color: Colors.grey),),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),

          ],


        ),
      ),
    );
  }
}


class CircleProgressBar extends StatefulWidget {
  const CircleProgressBar({Key? key}) : super(key: key);

  @override
  _CircleProgressBarState createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: CircleProgressIndicatorPainter(
          progress: _progress,
        ),
      ),
    );
  }
}

class CircleProgressIndicatorPainter extends CustomPainter {
  final double progress;

  CircleProgressIndicatorPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10;
    final double radius = size.width / 2 - strokeWidth / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the circle background
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress
    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final double angle = 2 * pi * (progress);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, angle, false, progressPaint);

    // Draw the text
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '50%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    final Offset textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

