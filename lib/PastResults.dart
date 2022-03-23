import 'package:flutter/material.dart';


// class for the past results screen
class PastResults extends StatefulWidget {
  const PastResults({Key? key}) : super(key: key);

  @override
  _PastResultsState createState() => _PastResultsState();
}

class _PastResultsState extends State<PastResults> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              child: const Text(
                '\n\nPast Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Date: 07/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 75.1%\n\n'
                    'Date: 08/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 70.8%\n\n'
                    'Date: 09/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 68.2%\n\n'
                    'Date: 10/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 66.8%\n\n',
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  // go to graph screen
                },
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'View Graph',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              ),
            )
          ],
        )
    );
  }

}