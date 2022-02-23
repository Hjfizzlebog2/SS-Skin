import 'package:flutter/material.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:ss_skin_project/CreateAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateAccount(),
    );
  }
}