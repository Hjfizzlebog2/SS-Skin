import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'Constants.dart' as Constants;

class SeeResults extends StatelessWidget {
  final Map scan;
  final rng = Random();
  // A list of different things to say
  final List<String> list = ["The Results Are In", "The Scan Is Complete", "Your Picture Has Been Evaluated",
  "Scan Completed", "Photo Analyzed"];

  static const screenColor = Constants.Constants.amber;
  static const textColor = Colors.black;

  SeeResults({
    Key? key,
    required this.scan,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor, //Colors.amber[600],
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => GeneratedReport(scan: scan))
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
        Container(
        alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child:
          Text(
            list[rng.nextInt(5)], //list.length?
            textAlign: TextAlign.center,
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 34,
              color: textColor,
            ),
          ),
        ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Tap to See Results',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: textColor,
                ),
              ),
            )
        ],
        ),
      )
    );
  }

}