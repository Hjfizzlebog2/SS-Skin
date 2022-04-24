import 'package:flutter/material.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';

import 'RegisteredHomePage.dart';

class NextStepsPsoriasis extends StatelessWidget {
  const NextStepsPsoriasis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
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
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: const Text(
                      'Psoriasis',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34
                      )
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 15),
                  child: const Text(
                    'See a Doctor If You...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    'Have discomfort or pain\n\n'
                        'Have joint problems such as pain, swelling, or inability to\n'
                        'perform daily tasks\n\n'
                        'Do not improve from treatment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                        primary: Colors.cyan[600]
                    ),
                    label: const Text(
                        'See Nearby Dermatologists',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    ),
                    icon: const Icon(Icons.navigate_next),
                  )
              )
            ]
        )
    );
  }
}