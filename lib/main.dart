import 'package:flutter/material.dart';
import 'package:ss_skin_project/LogInScreen.dart';

// main class, runs app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogInScreen(),
    );
  }
}