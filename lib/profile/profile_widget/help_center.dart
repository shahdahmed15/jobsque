import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/profile/profile.dart';
import 'package:jobsquee/widget/custom_search.dart';

import '../../compant.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(children: [IconButton(onPressed: (){navigatorPage(context, profile_screen());}, icon: Icon(Icons.arrow_back,color:Colors.black,)),SizedBox(width: 100,),Text("Help Center",style: TextStyle(color: Colors.black),)],)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(controller: searchController, hintText: "What can we help?"),
              SizedBox(height: 5,),
              ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => HelpCenterTile(
                  HelpCenterModel(
                    title: 'Lorem ipsum dolor sit amet',
                    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////
class HelpCenterTile extends StatefulWidget {
  final HelpCenterModel helpCenterModel;
  const HelpCenterTile(this.helpCenterModel, {super.key});

  @override
  State<HelpCenterTile> createState() => _HelpCenterTileState();
}

class _HelpCenterTileState extends State<HelpCenterTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color:Colors.grey,),
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
          elevation: 0.3,
          child: ExpansionTile(
            title: Text(
              widget.helpCenterModel.title,
              style:  TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            trailing: const Icon(Iconsax.arrow_down_1),
            children: <Widget>[
              ListTile(
                title: Text(
                  widget.helpCenterModel.body,
                  style:  TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w400,

                  ),
                ),
              )
            ],
          ),
        ));
  }
}
///////////////////////////////////////////////////////////////////////////////
class HelpCenterModel {
  final String title;
  final String body;

  HelpCenterModel({required this.title, required this.body});
}