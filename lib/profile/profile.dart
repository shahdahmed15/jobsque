import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/home/screen/Home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsquee/profile/completeProfile/complet_profile.dart';
import 'package:jobsquee/profile/completeProfile/portflio.dart';
import 'package:jobsquee/profile/cubit/profile_cubit.dart';
import 'package:jobsquee/profile/cubit/profile_state.dart';
import 'package:jobsquee/profile/profile_widget/edit_screen.dart';
import 'package:jobsquee/profile/profile_widget/help_center.dart';
import 'package:jobsquee/profile/profile_widget/langauge_screen.dart';
import 'package:jobsquee/profile/profile_widget/notification.dart';
import 'package:jobsquee/profile/profile_widget/privacy_term.dart';
import 'package:jobsquee/profile/profile_widget/term&condition.dart';
import '../shared/cubit/auth_cubit.dart';
import '../shared/cubit/state.dart';
import '../ui/social_login/login/login/login.dart';
import '../widget/toast.dart';
import 'login_security/login_security.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  TextEditingController ?_nameController;
  setDataToTextField(data){
    return ListView(
      children: [
        buildTop(),
        SizedBox(height: 40,),
        Container(
          child: Column(
            children: [
              Container(child:Column(
                children: [
                  Text(data['name']),
                  Text(data['bio'],style: TextStyle(color: Colors.grey),)
                ],
              )
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left:70,right: 35 ),
                color:  HexColor("#D1D5DB"),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    buildButton(text: "Applied", value: 42),
                    Container(child: VerticalDivider(),height: 24,),
                    buildButton(text: "Reviewed", value: 23),
                    Container(child: VerticalDivider(),height: 24),
                    buildButton(text: "Contacted", value: 16),


                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About",style: TextStyle(color:Colors.grey ),),
                        TextButton(onPressed: (){updateData();}, child: Text("Edit",style: TextStyle(color: Colors.blue),))
                      ],
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Type information about yourself, then click Edit",
                        border: InputBorder.none,),
                      controller: _nameController = TextEditingController(text: data['about']),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        buildGeneral()

      ],
    );

  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          "about":_nameController!.text,


        }
    ).then((value) => print("Updated Successfully"));
  }
  late AuthCubit cubit;
  late ProfileCubit profileCubit;
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AuthCubit.get(context);
    profileCubit = ProfileCubit.get(context);
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, SocialAuthState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              var data = snapshot.data;
              if(data==null){
                return Center(child: CircularProgressIndicator(),);
              }
              return setDataToTextField(data);
            },

          ),

        );
      },
    );
  }
///////////////////////////////////////////list_tile
  Widget buildGeneral(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10,top: 5),
          color: Colors.grey[350],
          width: double.infinity,
          height: 30,
          child: Text("General ",style: TextStyle(color: Colors.grey,fontSize: 15),),
        ),
        GestureDetector(
          onTap: (){navigatorPage(context, Edit_Screen());},
          child: build_listtile(image: "assets/images/fram1.png", text: "Edit"),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            navigatorPage(context, Portflio());
          },
          child: build_listtile(image: "assets/images/fram2.png", text: "Portfolio"),
        ),
        Divider(),
        GestureDetector(
          onTap: (){navigatorPage(context, LanguageScreen());},
          child: build_listtile(image: "assets/images/fram3.png", text: "Language"),
        ),
        Divider(),
        GestureDetector(
          onTap: (){navigatorPage(context, Notification_Setting ());},
          child: build_listtile(image: "assets/images/fram4.png", text: "Notification"),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            navigatorPage(context, LoginAndSecurityScreen());
          },
          child: build_listtile(image: "assets/images/fram5.png", text: "Login and security"),
        ),
        Container(
          padding: EdgeInsets.only(left: 10,top: 5),
          color: Colors.grey[350],
          width: double.infinity,
          height: 30,
          child: Text("Others ",style: TextStyle(color: Colors.grey,fontSize: 15),),
        ),
        GestureDetector(
          onTap: (){
            navigatorPage(context, Complete_Profile());
          },child: ListTile(leading: Text("Accesibility"),trailing: Icon(Icons.arrow_forward),),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            navigatorPage(context, HelpCenterScreen());
          },child: ListTile(leading: Text("Help center"),trailing: Icon(Icons.arrow_forward),),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            navigatorPage(context, TermsAndConditionsScreen());
          },child: ListTile(leading: Text("Terms & conditions"),trailing: Icon(Icons.arrow_forward),),
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            navigatorPage(context, PrivacyAndPolicyScreen());
          },child: ListTile(leading: Text("Privacy policy"),trailing: Icon(Icons.arrow_forward),),
        ),





      ],
    );
  }
/////////////////////////////////////////////3
  Widget buildTop(){
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(top:150,child: buildProfileImage()),
      ],
    );
  }
//////////////////////////////////////////////الخلفيه/1
  Widget buildCoverImage() => Container(
    width: double.maxFinite,
  height: 200,
  color: Colors.blue.withOpacity(.2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){navigatorPage(context, HomeScreen());}, icon: Icon(Icons.arrow_back)),
        Text("Profile",style: TextStyle(fontSize: 20,color: Colors.black),),
       IconButton(onPressed: (){
         signOut();
         navigatorPage(context, LoginScreen());
         showToast(message: "Successfully signed out");
       }, icon: Icon(Iconsax.logout,color: Colors.red))

      ],
    ),

      );
///////////////////////////////////////////////////////الاسم و الوظيفه4
  buildContent() {


    return Container(
      child: Column(
        children: [
          Container(child:Column(
            children: [
              Text("shahd"),
              Text("software engineer",style: TextStyle(color: Colors.grey),)
            ],
          )
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left:70,right: 35 ),
            color:  HexColor("#D1D5DB"),
            alignment: Alignment.center,
            child: Row(
              children: [
                buildButton(text: "Applied", value: 42),
                Container(child: VerticalDivider(),height: 24,),
                buildButton(text: "Reviewed", value: 23),
                Container(child: VerticalDivider(),height: 24),
                buildButton(text: "Contacted", value: 16),


              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About",style: TextStyle(color:Colors.grey ),),
                    TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Colors.blue),))
                  ],
                ),
                SizedBox(height: 5),
                Text("I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                  style: TextStyle(color: Colors.grey,fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//////////////////////////////////////////2الصوره
Widget buildProfileImage()=>CircleAvatar(
  radius: 40,
     backgroundColor: Colors.grey[800],
  backgroundImage: AssetImage("assets/images/twitter.png"),
);
//////////////////////////////////////applied/review
Widget buildButton({
  required String text,
  required int value,
})=>MaterialButton(
  padding: EdgeInsets.symmetric(vertical: 4),
    onPressed: (){},
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  child:Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(text,style: TextStyle(color: Colors.grey),),
      SizedBox(height: 3,),
      Text('$value',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      SizedBox(height: 3,),
    
    ],
  ) ,
);
/////////////////////////////////////////////////////////////////////////////////////
Widget build_listtile({
  required String image,
  required String text,
})=>ListTile(
  leading: Image.asset(image),
  title: Text(text),
  trailing: Icon(Icons.arrow_forward),
);
///////////////////////////////////////////
class auth{
  final FirebaseAuth _firebaseAuth;
  auth(this._firebaseAuth);
  Stream<User?>get authchanges=>_firebaseAuth.authStateChanges();

  Future<void>signOut()async{
    await _firebaseAuth.signOut();
  }
}
//////////////////////////////////////////////////////////

