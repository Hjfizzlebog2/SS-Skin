import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'Constants.dart';

class SeeResults extends StatelessWidget {
  final Map scan;
  final String q1;
  final String q2;
  final bool q3;
  final String time;

  final rng = Random();
  // A list of different things to say
  final List<String> list = ["The Scan Is Complete", "Your Picture Has Been Evaluated",
  "Scan Completed"];

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;

  SeeResults({
    Key? key,
    required this.scan,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.time
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
              MaterialPageRoute(builder: (context) => GeneratedReport(scan: scan,
                q1: q1, q2: q2, q3: q3, time: time))
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
            list[rng.nextInt(3)] + '\n', //list.length?
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
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