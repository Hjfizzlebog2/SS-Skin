import 'package:flutter/material.dart';
import 'package:ss_skin_project/PastResults.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';

import 'Constants.dart';

// class for the log history screen
class LogHistory extends StatelessWidget {
  LogHistory({Key? key}) : super(key: key);

  static const screenColor = Constants.cyan; // Colors.white
  final Color buttonColor = Colors.cyan[600] as Color; //Colors.cyan[600]
  static const textColor = Colors.white; //Colors.white
  static const titleColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
            iconTheme: const IconThemeData(
              color:textColor,
            )
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'What would like\n to see?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/NewLogHistory.png',
                  height: 230,
                  width: 230,
                  fit: BoxFit.fitWidth,
                )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    elevation: Constants.buttonElevation
                ),
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'See Past Pictures',
                    style: TextStyle(
                      color: textColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
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
                    MaterialPageRoute(builder: (context) => const PastResults()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                  elevation: Constants.buttonElevation
                ),
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'See Past Results',
                    style: TextStyle(
                      color: textColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
          ],
        )
    );
  }
}