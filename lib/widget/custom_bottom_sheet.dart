import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class BottomSheetItem extends StatelessWidget {
  final String actionName;
  final IconData? actionIcon;
  final bool hasIcon;
  final void Function()? onTap;
  const BottomSheetItem(this.actionName, {super.key,this.actionIcon,  this.hasIcon=true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),

          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: Colors.cyanAccent),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: hasIcon? Icon(
              actionIcon,
              size: 20.0,
            ): null,
            title: Text(
              actionName,
              style:  TextStyle(
                color: Colors.cyanAccent,
                fontSize: 13.5,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,

              ),
            ),
            trailing: const Icon(
              Iconsax.arrow_right_3,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
class CustomBottomSheet extends StatelessWidget {
  final List<Widget> items;
  final bool isTitled;
  final String? text;
  const CustomBottomSheet({super.key, required this.items,  this.isTitled=false,  this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(

        children: [
          Container(
            height: 6.0,
            width: MediaQuery.of(context).size.width*0.2,
            // padding: const EdgeInsets.all(14),
            decoration: ShapeDecoration(
              color: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: Colors.cyanAccent),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          SizedBox(height: 3),
          isTitled? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text!,
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 15.5,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,

                ),
              ),
            ],
          ):SizedBox(),
          Column(
            children: items,
          )

        ],
      ),
    );
  }
}