import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'ScreeningBreakdown.dart';
import 'LogHistory.dart';

// class for the registered home page screen
class RegisteredHomePage extends StatelessWidget {
  static late UserCredential user;

  const RegisteredHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Image.asset('assets/images/registered_homepage.jpg'),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GeneratedReport()),
                  );
                },
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'Create New Entry',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)),
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
                    MaterialPageRoute(builder: (context) => const LogHistory()),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text(
                    'View Log History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)),
              ),
            ),
          ],
        )
    );
  }
}