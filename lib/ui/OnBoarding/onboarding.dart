import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/button.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';
import '../social_login/register/Register.dart';
import 'OnBoardingItem.dart';

class OnBoarding extends StatefulWidget {
   const OnBoarding({Key? key}) : super(key: key);
//final PageController? pagecontroller;

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
//
late final PageController? pagecontroller;
@override
void initState(){
  pagecontroller=PageController(
    initialPage: 0
  )..addListener(() {
    setState(() {

    });
  });
}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAuthState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: pagecontroller,
                  children: [
                   PageViewItem(image: 'assets/images/Background.png',title: "Find a job, and start building your career from now on",subtitle: 'Explore over 25,924 available job roles and upgrade your operator now.',),
                    PageViewItem(image: 'assets/images/Background1.png',title: "Hundreds of jobs are waiting for you to join together",subtitle: 'Immediately join us and start applying for the job you are interested in.',),
                    PageViewItem(image: 'assets/images/Background (2).png',title: "Get the best choice for the job you've always dreamed of",subtitle: 'The better the skills you have, the greater the good job opportunities for you.',)



                  ],
                ),
                Positioned(
                  bottom: 200,
                    left: 0,
                    right: 0,

                    child: customindector(
                      dotindex: pagecontroller!.hasClients?pagecontroller?.page:0,
                    )),
               Positioned(
                 top: 40,
                 child: Row(
                   children: [
                     Image.asset('assets/images/Logo.png'),
                     SizedBox(width: 220,),
                     Visibility(
                       visible: pagecontroller!.hasClients?(pagecontroller?.page==2?false:true):true,
                         child: InkWell(child: Text("Skip"),))
                   ],
                 ),
               ),

                Positioned(
                  bottom: 120,
                  left: 25,
                    right: 25,
                    child: customButtom(
                      onTap: (){
                        if(pagecontroller!.page!<2){
                          pagecontroller?.nextPage(duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }else{
                          navigateTo(context,SignUpScreen());
                        }
                      },
                        text: pagecontroller!.hasClients?(pagecontroller?.page==2?"Get started":"Next"):"Next"

                    )
                )


              ],

            )
          );
        },

    );
  }

  void navigateTo(context , widget)=> Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));


}

class customindector extends StatelessWidget {
  const customindector({Key? key,@required this.dotindex}) : super(key: key);
  final double? dotindex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(

        decorator: DotsDecorator(
            color:Colors.blue.shade100),
        dotsCount: 3,
        position: dotindex!,
    );
  }
}

