import 'package:flutter/material.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';

class FurtherDetailsMelanoma extends StatelessWidget {
  const FurtherDetailsMelanoma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: const Text(
                      'Melanoma',
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
                    'Melanoma is the most serious type of skin cancer.\n \n'
                        'Melanoma occurs when the pigment-producing cells that give'
                        'color t the skin become cancerous.',
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
                    'A new, unusual growth or change in an existing mole\n \n'
                        'Mole color changes\n \n'
                        'Changes in mole border',
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