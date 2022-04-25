import 'package:flutter/material.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';
import 'Constants.dart';

class NextStepsMelanoma extends StatelessWidget {
  const NextStepsMelanoma({Key? key}) : super(key: key);

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
            // automaticallyImplyLeading: false, //Maybe delete me
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
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: const Text(
                      'Signs of Melanoma\n',
                      style: TextStyle(
                        color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 34
                      )
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 15),
                  child: const Text(
                    'See a doctor if you...',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    '• Notice a new pigmented or unusual looking growth\n\n'
                        '• Have a mole change in color, shape, or diameter greater than 1/4 inch\n\n'
                        '• Notice an irregular, notched or scalloped borders',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
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
                        MaterialPageRoute(builder: (context) => const ZipCodeCollection()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: Constants.buttonElevation,
                        primary: buttonColor
                    ),
                    label: const Text(
                        'Find Nearby Dermatologists',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18, color: textColor)
                    ),
                    icon: const Icon(Icons.navigate_next, color: textColor),
                  )
              )
            ]
        )
    );
  }
}