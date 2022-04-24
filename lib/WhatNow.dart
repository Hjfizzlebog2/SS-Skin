import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ss_skin_project/FurtherDetailsMelanoma.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';

import 'Constants.dart' as Constants;
import 'LogHistory.dart';
import 'RegisteredHomePage.dart';

class WhatNow extends StatelessWidget {

  WhatNow({
    Key? key,
  }) : super(key: key);

  final rng = Random();
  // A list of different things to say
  final List<String> list = ["Where to now?", "So what's next?", "Where to next?",];

  static const screenColor = Constants.Constants.purple;//Constants.Constants.mint;
  static const buttonColor = Constants.Constants.purpleAccent;//Constants.Constants.mintAccent;
  static const textColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: textColor,
            ),
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
            automaticallyImplyLeading: false, //Maybe delete me
            actions: <Widget> [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisteredHomePage())
                        );
                      },
                      child: const Icon(
                        Icons.home,
                        color: textColor,
                      )
                  )
              )
            ]
        ),
        // backgroundColor: screenColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                child: Text(
                  list[rng.nextInt(3)],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: textColor
                  ),
                ),
              ),
              //Image.asset('assets/images/next_steps.jpg',scale: 0.3,),
              Container(
                padding: const EdgeInsets.all(15),
                width: 270,
                height: 90,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PhotoSubmission()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next,
                  color: textColor),
                  label: const Text(
                      'Scan again',
                      style: TextStyle(
                          color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: 270,
                height: 90,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogHistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'See past scans',
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: 270,
                height: 90,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ZipCodeCollection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'Find nearby doctors',
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: 270,
                height: 90,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FurtherDetailsMelanoma()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'Read more about melanoma',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ),
              ),
            ],
          ),
    );
  }

}