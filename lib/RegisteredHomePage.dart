import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/NearbyDermatologists.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';
import 'Constants.dart';
import 'LogHistory.dart';
import 'ZipCodeCollection.dart';

// FIXME: Renderflex overflow error, "use Expanded widget"?

// class for the registered home page screen
class RegisteredHomePage extends StatelessWidget {
  static late UserCredential user;

  RegisteredHomePage({Key? key}) : super(key: key);

  final rng = Random();
  // A list of different things to say
  final List<String> list = ["Welcome Home!", "Hey there!", "Welcome Back!"];

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.cyan2Accent;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(
          title: const Text('Skin Safety Scanner',
          style: TextStyle(
            color: textColor,
            )
          ),
          centerTitle: true,
          backgroundColor: buttonColor,
          automaticallyImplyLeading: false
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: Text(
                list[rng.nextInt(3)],
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Material(
              elevation: Constants.pfpElevation,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
                'assets/images/NewHome.png',
              height: 230,
              width: 230,
              fit: BoxFit.fitWidth,
            ) ),
           // Image.asset('assets/images/registered_homepage.jpg'),
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
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'Start Scanning',
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                      color: textColor,
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
                  elevation: Constants.buttonElevation,
                    primary: buttonColor
                ),
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'See Past Scans',
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                      color: textColor,
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
                    MaterialPageRoute(builder: (context) => ZipCodeCollection()),
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
                      // fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 18
                    )
                ),
              ),
            ),
          ],
        )
    );
  }
}