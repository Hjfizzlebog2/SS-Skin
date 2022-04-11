import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';

import 'LogInScreen.dart';

// main class, runs app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: "Skin Safety Scanner",
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y",
      messagingSenderId: "121689515063",
      projectId: "skin-safety-scanner",
      appId: '1:121689515063:android:3f3fb5bee8296b028e8bb2',
      storageBucket: 'gs://skin-safety-scanner/'
    ),
  );
  print(FirebaseAppCheck.instance.getToken());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // added a splash screen that loads up every time a user launches the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skin Safety Scanner',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: const PhotoSubmission(),
          title: const Text(
            'Skin Safety Scanner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          image: Image.asset(
              'assets/images/registered_homepage.jpg',
              width: 300
          ),
          loadingText: const Text("Loading"),
          photoSize: 150.0,
          loaderColor: Colors.white,
          backgroundColor: Colors.redAccent[200],
        )
    );
  }
}