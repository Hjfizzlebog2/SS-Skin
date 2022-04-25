import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/FurtherDetailsMelanoma.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';
import 'Constants.dart';
import 'LogHistory.dart';
import 'RegisteredHomePage.dart';

class WhatNow extends StatelessWidget {

  WhatNow({
    Key? key,
  }) : super(key: key);

  final rng = Random();
  // A list of different things to say
  final List<String> list = ["Where To Now?", "So What's Next?", "Where To Next?"];

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;

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
                  fontWeight: FontWeight.w600,
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: screenColor,
            automaticallyImplyLeading: false, //Maybe delete me
            actions: <Widget> [
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
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
                  list[rng.nextInt(3)] + '\n',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
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
                      MaterialPageRoute(builder: (context) => const ScreeningBreakdown()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next,
                  color: textColor),
                  label: const Text(
                      'Scan Again',
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
                      MaterialPageRoute(builder: (context) => const LogHistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'See Previous Scans',
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
                    elevation: Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'Find Nearby Doctors',
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
                    elevation: Constants.buttonElevation,
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'More About Melanoma',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 17
                      )
                  ),
                ),
              ),
            ],
          ),
    );
  }

}