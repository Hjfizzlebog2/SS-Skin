import 'package:flutter/material.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';

import 'RegisteredHomePage.dart';

class FurtherDetailsPsoriasis extends StatelessWidget {
  const FurtherDetailsPsoriasis({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: const Text(
                      'More About\n Psoriasis',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    'Psoriasis is a skin disease that causes red, itchy scaly patches.\n \n'
                        'Atopic dermatitis is a common, long-term (chronic) disease. It'
                        'tends to go through cycles, flaring periodically.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)
                ),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(35, 25, 35, 15),
                  child: const Text(
                    'Signs and symptoms may include:',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    'Red skin with silvery scales\n \n'
                        'Dry skin that may bleed or itch\n \n'
                        'Swollen and stiff joints',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)
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
                        primary: Colors.cyan[600]
                    ),
                    label: const Text(
                        'Next',
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