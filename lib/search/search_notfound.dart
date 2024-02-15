import 'package:flutter/material.dart';
class SearchScreenNotFound extends StatelessWidget {
  const SearchScreenNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Search.png"),
              SizedBox(height: 3),
              Text(
                'Search not found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w900,

                ),
              ),
              SizedBox(height: 1),
              Text(
                'Try searching with different keywords so we can show you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.5,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }}