import 'package:flutter/material.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';
import 'Constants.dart';
import 'RegisteredHomePage.dart';

class FurtherDetailsMelanoma extends StatelessWidget {
  const FurtherDetailsMelanoma({Key? key}) : super(key: key);

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: textColor,
            ),
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: screenColor,
            actions: <Widget> [
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisteredHomePage())
                        );
                      },
                      child: const Icon(
                        Icons.home,
                        color: textColor,
                      )
                  )
              )
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
                      'What is Melanoma?\n',
                      style: TextStyle(
                        color: textColor,
                          fontWeight: FontWeight.w600,
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
                        fontWeight: FontWeight.w600,
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
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NextStepsMelanoma()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: Constants.buttonElevation,
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