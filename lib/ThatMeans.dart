import 'package:flutter/material.dart';

import 'Constants.dart';
import 'WhatNow.dart';


class ThatMeans extends StatelessWidget {
  final Map scan;

  const ThatMeans({
    Key? key,
    required this.scan,
  }) : super(key: key);

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
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
                      '\n\n\n\nUnderstanding Your Scan\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 30
                      )
                  )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(30, 15, 15, 20),
                child: Column(
                  children: const <Widget>[
                    Text(
                      "If your percentage was above 75%, "
                          "we recommend checking out our further info on Melanoma.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: textColor,
                      ),
                    ),


                  ],
                )
              ),
              //so what now container location
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tap to Continue',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: textColor
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: const Text(
                  '\n\n\n\n\n\nSkin Safety Scanner is not intended for self-diagnosis.'
                      '\nConsult a dermatologist for an official diagnosis.',
                  style: TextStyle(fontSize: 14, color: textColor),
                ),
              ),

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
//Scrapped Text Container
Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: const Text(""
                          "Be advised that scans may be affected by lighting and image quality.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                    ),

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