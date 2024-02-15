import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JobDetailsPeopleTile extends StatelessWidget {
  JobDetailsPeopleTile({Key? key, required this.image, required this.name, required this.job, required this.yearsOfExp}) : super(key: key);
  final String image;
  final String name;
  final String job;
  final String yearsOfExp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image, width: 40, height: 40),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Work during',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,

            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(job,
              style:  TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
              )),
          Text(
            yearsOfExp,
            //textAlign: TextAlign.right,
            style: TextStyle(
              color:Colors.blue,
              fontSize: 10,
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w500,

            ),
          ),

        ],
      ),

      contentPadding: EdgeInsets.zero,

    );
  }
}