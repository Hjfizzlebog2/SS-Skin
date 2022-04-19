import 'package:flutter/material.dart';
import 'Questionnaire.dart';

// class for the screening breakdown screen
class ScreeningBreakdown extends StatelessWidget {
  const ScreeningBreakdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
          automaticallyImplyLeading: false
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              child: const Text(
                '\n\nScreening Breakdown',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text(
                  '• The screening starts with a brief optional survey \n\n'
                      '• You\'ll next snap a photo of your skin condition\n\n' //said "analyzation" before
              '• Your photo will then be analyzed and a scan report will be available to you within seconds.\n\n\n\n\n',
                style: TextStyle(fontSize: 17),
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
                    MaterialPageRoute(builder: (context) => const Questionnaire()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                  icon: const Icon(Icons.navigate_next),
                label: const Text(
                    'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: const Text(
                    'Skin Safety Scanner is not intended for self-diagnosis. Please consult a dermatologist for medical diagnosis. \n\n',
                style: TextStyle(fontSize: 14),
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

