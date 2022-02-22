import 'package:flutter/material.dart';
import 'package:skin_safety_scanner/RegisteredHomePage.dart';
import 'ResetPassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //FIXME: Change back the below to RegisteredHomePage()
      home: ResetPassword(),
    ); // Material App
  }
}