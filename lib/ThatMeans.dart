import 'package:flutter/material.dart';

import 'Constants.dart' as Constants;
import 'WhatNow.dart';


class ThatMeans extends StatelessWidget {
  final Map scan;

  const ThatMeans({
    Key? key,
    required this.scan,
  }) : super(key: key);

  static const screenColor = Constants.Constants.amber;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
    body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WhatNow())
        );
      },
    child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: const Text(
                      'Understanding Your Scan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 34
                      )
                  )
              ),
              Container(
                alignment: Alignment.topCenter,

                padding: const EdgeInsets.fromLTRB(30, 15, 15, 20),
                child: const Text(
                  "If your percentage was above 75% or otherwise worried you, "
                  "we recommend checking out our further info on Melanoma.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: textColor,
                  ),
                ),
              ),
              //so what now container location
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tap to Continue',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor
                  ),
                ),
              ),
              /*
              Container(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: const Text(
                  '\n\n\n\n\n\nSkin Safety Scanner is not intended for self-diagnosis. Please consult a dermatologist for an official medical diagnosis. \n\n',
                  style: TextStyle(fontSize: 14, color: textColor),
                ),
              ),
              */
            ],
          ),
        )
    );
  }



}

/*
//Quotes for Understanding Scan

"If your percentage was above 75% or otherwise worried you,
we recommend checking out our further info on Melanoma."


'A percentage greater than 80% is unlikely to be coincidental. However, the'
                      ' algorithm can make mistakes.'
 */

/*
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'So what now?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                  ),
                ),
              ),

 */