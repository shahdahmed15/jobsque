import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsquee/compant.dart';
import 'package:jobsquee/search/search_notfound.dart';

import '../home/widget/Recent_Job.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _allResults=[];
  List _results=[];
  var _searchControllr=TextEditingController();
  final List<String> items = [
    '\$16K - \$17K',
    '\$18K - \$19K',
    '\$20K - \$21K',
  ];
  String? selectedValue;
  List<String> choices = [
    'Full Time',
    'Remote',
    'Post data',
    'Content',
    'Part Time',
    'Onsite',
    'Internship'
  ];
  List<String> selectedChoices = [];
  


  @override
  void initState(){
   // getClientStream();
    _searchControllr.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged(){
    print(_searchControllr.text);
    searchResultList();
  }

  searchResultList(){
    var showResult=[];
    if(_searchControllr.text!=""){
      for(var clientSnapShot in _allResults){
        var name=clientSnapShot['name'].toString().toLowerCase();
        if(name.contains(_searchControllr.text.toLowerCase())){
          showResult.add(clientSnapShot);
        }
      }

    }else{
      showResult=List.from(_allResults);
    }
    setState(() {
      _results=showResult;
    });
  }

  getClientStream()async{
    var data=await FirebaseFirestore.instance.collection("job").orderBy("name").get();
    setState(() {
      _allResults=data.docs;
    });
    searchResultList();
  }
  @override
  void dispose(){
    _searchControllr.removeListener(_onSearchChanged);
    _searchControllr.dispose();
    super.dispose();

  }
  @override
  void didChangeDependencies(){
    getClientStream();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: CupertinoSearchTextField(
          controller: _searchControllr,

        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Icon(Iconsax.setting_4),
                  SizedBox(width: 5,),
                  Wrap(
                    spacing: 4,
                    children: choices.map((choice) {
                      return ChoiceChip(
                        selectedColor: Colors.blue[900],
                        label: Text(choice,style: TextStyle(color: Colors.white)),
                        selected: selectedChoices.contains(choice),
                        onSelected: (value) {
                          setState(() {
                            if (value) {
                              selectedChoices.add(choice);
                            } else {
                              selectedChoices.remove(choice);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
                itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        enableDrag: false,
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)
                            )
                        ),
                        builder: (BuildContext context) {
                          return Container(

                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          iconSize: 25,
                                          icon: const Icon(Iconsax.arrow_left4)),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Set Filter",
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.w700)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Reset",style: TextStyle(color: Colors.blue),),
                                    )
                                  ],
                                ),
                                Text("Job Title",style: TextStyle(fontWeight: FontWeight.w600)),
                                defaultFormField(labelName: _results[index]['name'],iconData: Icons.shopping_bag_outlined),
                                Text("Location",style: TextStyle(fontWeight: FontWeight.w600)),
                                defaultFormField(labelName: _results[index]['location'],iconData: Iconsax.location),
                                Text("Salary",style: TextStyle(fontWeight: FontWeight.w600)),
                                SizedBox(height: 5,),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Row(
                                      children: [
                                        Icon(
                                          Iconsax.dollar_circle,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Salary',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 60,
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),

                                      ),
                                      elevation: 0,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                          Icons.arrow_drop_down_rounded
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Colors.grey,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      // offset: const Offset(-20, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all<double>(6),
                                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Job Type',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontFamily: 'SFProDisplay',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Column(
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        spacing: 4,
                                        children: choices.map((choice) {
                                          return ChoiceChip(
                                            selectedColor: Colors.blue[900],
                                            label: Text(choice,style: TextStyle(color: Colors.white)),
                                            selected: selectedChoices.contains(choice),
                                            onSelected: (value) {
                                              setState(() {
                                                if (value) {
                                                  selectedChoices.add(choice);
                                                } else {
                                                  selectedChoices.remove(choice);
                                                }
                                              });
                                            },
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 60,),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    onPressed: () {
                                     _showModalBottomSheet(context);
                                    },
                                    child:Text('Show Result'),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    minWidth: 400,
                                    height: 50,
                                  ),
                                ),


                              ],
                            ),
                          );
                        },
                      );

                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                              width:100,
                              height: 100,
                              decoration: ShapeDecoration(

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child:Image.network(_results[index]["image"])
                          ),
                          title: Text(_results[index]['name']),
                          subtitle: Row(
                            children: [
                              Text(
                                "${_results[index]["company"]}•",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${_results[index]["location"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontFamily: 'SFProDisplay',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                //  cubit.addFavourite(widget.jobData.id.toString());
                                // cubit.handleFavourite( widget.jobData);
                              },

                              icon:Icon(Iconsax.archive_minus)
                          ),
                          contentPadding: EdgeInsets.zero,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildbutton(color: Colors.blue, text: 'Full time', function: (){}),
                            buildbutton(color: Colors.blue, text: 'Remote', function: (){}),
                            buildbutton(color: Colors.blue, text: 'Senior', function: (){}),
                            Spacer(),
                            Column(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${_results[index]["price"]}\$",
                                        // text: '\$20',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/Month',
                                        style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 10,
                                          fontFamily: 'SFProDisplay',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )


                          ],
                        )
                      ],
                    ),
                  )
                );
                },

            ),
          ),
        ],
      )
    );
  }
}


///////////////
void _showModalBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      List<String> choicess = [
        'Remote',
        'Any',
        'Hybird',
        'Onsite',
      ];
      List<String> selectedChoicess = [];
      return Center(
        child: Container(
          height: 300.0, // Set the height here
          child: Column(
            children: [
              Text("On-Site/Remote"),
              Container(
                child: Column(
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 4,
                      children: choicess.map((choice) {
                        return ChoiceChip(
                          selectedColor: Colors.blue[900],
                          label: Text(choice,style: TextStyle(color: Colors.white)),
                          selected: selectedChoicess.contains(choice),

                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    navigatorPage(context, SearchScreenNotFound());
                  },
                  child:Text('Show Result'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 400,
                  height: 50,
                ),
              ),
            ],
          )
        ),
      );
    },
  );
}

