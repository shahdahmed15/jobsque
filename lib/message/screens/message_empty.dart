import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../widget/custom_bottom_sheet.dart';
import '../../widget/custom_search.dart';
import 'message_screen.dart';




class MessageEmptyScreen extends StatelessWidget {
  MessageEmptyScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,centerTitle:true,title: Text("Messages",style: TextStyle(color: Colors.black)),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomSearchBar(
                    controller: searchController,
                    hintText: 'Search messages....',
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                InkWell(
                  onTap: () {
                    Scaffold.of(context).showBottomSheet<void>(
                          (BuildContext context) =>  const CustomBottomSheet(
                        items: [
                          BottomSheetItem(
                            'Unread',
                            hasIcon: false,
                          ),
                          BottomSheetItem(
                            'Spam',
                            hasIcon: false,
                          ),
                          BottomSheetItem(
                            'Archived',
                            hasIcon: false,
                          ),
                        ],
                        isTitled: true,
                        text: 'Message filters',
                      ),
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.cyan),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Icon(Iconsax.setting_4),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Data Ilustration.png"),
                    SizedBox(height: 2),
                    Text(
                      'You have not received any\n messages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Once your application has reached the interview stage, you will get a message from the recruiter.',
                      textAlign: TextAlign.start,
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
            ),
          ],
        ),
      ),
    );
  }
}
