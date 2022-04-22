import 'package:flutter/material.dart';
import 'package:ss_skin_project/FurtherDetailsMelanoma.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';

import 'Constants.dart' as Constants;
import 'LogHistory.dart';
import 'RegisteredHomePage.dart';

class WhatNow extends StatelessWidget {

  const WhatNow({
    Key? key,
  }) : super(key: key);

  static const screenColor = Constants.Constants.mint;
  static const buttonColor = Constants.Constants.mintAccent;
  static const textColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: screenColor,
        appBar: AppBar(
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  color: textColor,
                )),
            centerTitle: true,
            backgroundColor: buttonColor,
            automaticallyImplyLeading: false,
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
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
                child: const Text(
                  'So what now?',
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
                      MaterialPageRoute(builder: (context) => LogHistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'See Past Scans',
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
                      primary: buttonColor
                  ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'Read More About Melanoma',
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