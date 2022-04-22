import 'package:flutter/material.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';

import 'Constants.dart';
import 'RegisteredHomePage.dart';

class FurtherDetailsMelanoma extends StatelessWidget {
  const FurtherDetailsMelanoma({Key? key}) : super(key: key);

  static const screenColor = Constants.teal;//Constants.red;
  static const buttonColor = Constants.tealAccent;//Constants.redAccent;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(

            title: const Text('Skin Safety Scanner',
              style: TextStyle(
                color: textColor,
              ),
            ),
            iconTheme: const IconThemeData(
              color: textColor,
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ]
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: const Text(
                      'What is Melanoma?',
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 34
                      )
                  )
              ),
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 15),
                  child: const Text(
                    'Per Mayo Clinic:',
                    style: TextStyle(
                      color: textColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    'Melanoma is the most serious type of skin cancer.\n \n'
                        'Melanoma occurs when the pigment-producing cells that give '
                        'color to the skin become cancerous.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: textColor
                    )
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NextStepsMelanoma()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor,
                    ),
                    label: const Text(
                        'More Info',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18, color: textColor),
                    ),
                    icon: const Icon(Icons.navigate_next, color: textColor),
                  )
              )
            ]
        )
    );
  }
}