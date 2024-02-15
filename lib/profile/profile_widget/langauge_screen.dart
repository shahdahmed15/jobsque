import 'package:flutter/material.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/profile/profile.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       title: Row(children: [IconButton(onPressed: (){navigatorPage(context, profile_screen());}, icon: Icon(Icons.arrow_back,color:Colors.black,)),SizedBox(width: 100,),Text("Language",style: TextStyle(color: Colors.black),)],)
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              itemBuilder: (BuildContext context, int index) => CustomLanguageItem(index + 1, languages[index]),
              separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,),
            ),
          ]),
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////
class CustomLanguageItem extends StatefulWidget {
final int value;
final LanguageModel languageModel;

const CustomLanguageItem(this.value, this.languageModel, {super.key});

@override
State<CustomLanguageItem> createState() => _CustomLanguageItemState();
}
class _CustomLanguageItemState extends State<CustomLanguageItem> {
 // late ProfileCubit cubit;
  int _selectedValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      //  cubit.selectChoice(widget.value);
      },
      leading: SizedBox(
        width: 35,
        height: 35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            widget.languageModel.flag,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        widget.languageModel.lang,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13.5,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w500,

        ),
      ),
      trailing: Radio(
        value: widget.value,
        groupValue:_selectedValue ,
        onChanged: (value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
      contentPadding: EdgeInsets.zero,

    );
  }
}
///////////////////////////////////////////////////////////////////////////
class LanguageModel {
  final String lang;
  final String flag;
  const LanguageModel(this.lang, this.flag);
}
List<LanguageModel> languages = const [
  LanguageModel(
      'English', 'https://cdn-icons-png.flaticon.com/128/330/330425.png'),
  LanguageModel(
      'Indonesia', 'https://cdn-icons-png.flaticon.com/128/330/330476.png'),
  LanguageModel(
      'Arabic', 'https://cdn-icons-png.flaticon.com/128/330/330552.png'),
  LanguageModel(
      'Chinese', 'https://cdn-icons-png.flaticon.com/128/206/206818.png'),
  LanguageModel(
      'Dutch', 'https://cdn-icons-png.flaticon.com/128/3013/3013898.png'),
  LanguageModel(
      'French', 'https://img.icons8.com/?size=1x&id=pzp5DPl1IvyP&format=png'),
  LanguageModel(
      'German', 'https://cdn-icons-png.flaticon.com/128/3014/3014029.png'),
  LanguageModel(
      'Japanese', 'https://cdn-icons-png.flaticon.com/128/330/330622.png'),
  LanguageModel(
      'Korean', 'https://cdn-icons-png.flaticon.com/128/299/299854.png'),
  LanguageModel(
      'Portuguese', 'https://cdn-icons-png.flaticon.com/128/206/206628.png'),
];