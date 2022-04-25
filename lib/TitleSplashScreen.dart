import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ss_skin_project/FurtherDetailsEczema.dart';
import 'package:ss_skin_project/FurtherDetailsPsoriasis.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'package:ss_skin_project/NextStepsEczema.dart';
import 'package:ss_skin_project/NextStepsPsoriasis.dart';
import 'package:ss_skin_project/Questionnaire.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';
import 'Constants.dart';
import 'LogInScreen.dart';
import 'SeeResults.dart';
import 'WhatNow.dart';

class TitleSplashScreen extends StatelessWidget {
  const TitleSplashScreen({Key? key}) : super(key: key);

  // Sample Results from Machine Learning Scan
  // Can also use Constants.reportMap
  static const Map reportMap = {
    "Melanoma" : 0.893764823,
    "Not_Melanoma" : 1 - 0.893764823,
  };

  // added a splash screen that loads up every time a user launches the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skin Safety Scanner',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: LogInScreen(),
          title: const Text(
            '\nSkin Safety Scanner',
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.black
            ),
          ),
          image: Image.asset(
              'assets/images/title_picture.gif',
              width: 300
          ),
          loadingText: const Text("Loading"),
          photoSize: 150.0,
          loaderColor: Colors.black,
          backgroundColor: Colors.cyan[600],
        )
    );
  }
}