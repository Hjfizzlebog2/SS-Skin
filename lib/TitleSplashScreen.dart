import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
          seconds: 6,
          navigateAfterSeconds: const LogInScreen(),
          title: const Text(
            'Skin Safety Scanner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.white),
          ),
          image: Image.asset(
              'assets/images/title_picture.gif',
              width: 300
          ),
          // TODO: move loading circle up higher
          loadingText: const Text("Loading"),
          photoSize: 150.0,
          loaderColor: Colors.white,
          backgroundColor: Colors.tealAccent[700],
        )
    );
  }
}