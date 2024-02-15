import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  const CustomSearchBar({super.key,
    required this.controller,
    required this.hintText, this.onTap, this.keyboardType,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  //late SearchCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cubit=SearchCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(

        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: (value){
          //cubit.searchJob(name: value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          prefixIconColor: const Color(0xFF292D32),


          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.black38,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}