import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ss_skin_project/Questionnaire.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';
import 'LogInScreen.dart';

class TitleSplashScreen extends StatelessWidget {
  const TitleSplashScreen({Key? key}) : super(key: key);

  // added a splash screen that loads up every time a user launches the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skin Safety Scanner',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: const Questionnaire(),
          title: const Text(
            '\nSkin Safety Scanner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.white
            ),
          ),
          image: Image.asset(
              'assets/images/title_picture.gif',
              width: 300
          ),
          // TODO: move loading circle up higher
          loadingText: const Text("Loading"),
          photoSize: 150.0,
          loaderColor: Colors.white,
          backgroundColor: Colors.cyan[600],
        )
    );
  }
}