import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Questionnaire.dart';
import 'RegisteredHomePage.dart';

// class for the screening breakdown screen
class ScreeningBreakdown extends StatelessWidget {
  const ScreeningBreakdown({Key? key}) : super(key: key);
  static const bulletPointInsets = 25;

  static const screenColor = Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.cyan; // Constants.cyan;
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
                  fontWeight: FontWeight.bold,
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
            actions: <Widget> [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
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
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "\n\nLet's Break it Down",
                style: TextStyle(
                  color: textColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text(
                // Survey, Snap, Stats
                  '• The screening starts with a brief survey \n\n'
                      '• Next you\'ll snap a photo of your mole \n\n' //said "analyzation" before
              '• Then your photo will be scanned and a report\n   will be available to you in seconds\n',
                style: TextStyle(fontSize: 17, color: textColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Questionnaire()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: Constants.buttonElevation,
                    primary: buttonColor,
                ),
                  icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'Continue',
                    style: TextStyle(
                      color: textColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: const Text(
                    'Skin Safety Scanner is not intended for self-diagnosis. Please consult a dermatologist for medical diagnosis. \n\n',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor),
              ),
            ),
          ],
        )
    );
  }
}

/*
Modified Questionnaire 1

'• The screening starts with a brief optional survey \n\n'
                    '• You'll next snap a photo of your skin condition\n\n' //said "analyzation" before
                    '• Finally, your photo will be analyzed and a similarity report will be available within seconds.\n\n'
                    '• Not intended for self-diagnosis. Please consult a dermatologist an official diagnosis. \n\n'
Finally, your photo will be analyzed and a similarity report will be available within seconds.
Within seconds you'll have a report of how similar your photo is to positive test cases
You will have a similarity report of your photo within seconds

The screening starts with a brief optional survey
Next, you'll snap a photo of your skin condition
Finally, your photo will be analyzed and a similarity report will be available
within seconds.

Not intended for self-diagnosis.
Please consult a dermatologist an official diagnosis.

 */

/*
Original Questionnaire

'• This screening includes a brief questionnaire\n\n'
                    '• You will then submit a photo for analysis\n\n' //said "analyzation" before
                    '• Your image will be compared to an extensive database to generate your report\n\n'
                    'DISCLAIMER:\n\n'
                    '• Please note that this is NOT an official diagnosis\n\n'
                    '• If necessary, please seek help from a medical expert\n',

 */

