import 'package:flutter/material.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';

class NextStepsMelanoma extends StatelessWidget {
  const NextStepsMelanoma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: const Text(
                      'Melanoma',
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
                    'Per Mayo Clinic:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(35, 15, 35, 5),
                  child: const Text(
                    'See a doctor if you:',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                child: const Text(
                    'Notice a new pigmented or unusual looking growth\n\n'
                        'Have a mole change in color, shape, or diameter greater than 1/4 inch\n\n'
                        'Notice an irregular, notched or scalloped borders',
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