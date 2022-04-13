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
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
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
              padding: const EdgeInsets.all(15),
              child: const Text(
                '• This screening includes a brief questionnaire\n\n'
                    '• You will then submit a photo for analysis\n\n' //said "analyzation" before
                    '• Your image will be compared to an extensive database to generate your report\n\n'
                    'DISCLAIMER:\n\n'
                    '• Please note that this is NOT an official diagnosis\n\n'
                    '• If necessary, please seek help from a medical expert\n',
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
            )
          ],
        )
    );
  }
}