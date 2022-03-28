
import 'package:flutter/material.dart';
import 'package:ss_skin_project/LoginScreen.dart';
import 'package:ss_skin_project/NearbyDermatologists.dart'; //Remove me


// main class, runs app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //Might need to make this stateful widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}