import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/layout/TheMaster.dart';
import 'package:jobsquee/widget/custom_search.dart';


class NotificationEmptyScreen extends StatelessWidget {
  NotificationEmptyScreen({super.key});
  var _search=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      navigatorPage(context, SocialLayout());
                    },
                    iconSize: 20,
                    icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
              ),
              SizedBox(width: 10,),
             CustomSearchBar(controller:_search , hintText: "search")
            ],
          )),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    navigatorPage(context, SocialLayout());
                  },
                  iconSize: 20,
                  icon: const Icon(Iconsax.arrow_left4,color: Colors.black,)),
            ),
            Image.asset('assets/images/notification.png'),
            SizedBox(height: 2),
            Text(
              'No new notifications yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w700,

              ),
            ),
            Text(
              'You will receive a notification if there is something on your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,

              ),
            ),
          ],
        ),
      ),
    );
  }
}