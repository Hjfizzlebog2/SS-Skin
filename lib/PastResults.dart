import 'package:flutter/material.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';


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
                'Past Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Date: 07/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 75.1%',
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: 120,
                height: 60,
                child: TextButton(
                  child: const Text(
                      'View Photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                    );
                  },
                )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Date: 08/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 70.8%',
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: 120,
                height: 60,
                child: TextButton(
                  child: const Text(
                      'View Photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                    );
                  },
                )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Date: 09/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 68.2%',
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: 120,
                height: 60,
                child: TextButton(
                  child: const Text(
                      'View Photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                    );
                  },
                )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Date: 10/01/2021\n'
                    'Skin condition: Psoriasis\n'
                    'Probability: 66.8%',
                style: TextStyle(
                    fontSize: 17
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: 120,
                height: 60,
                child: TextButton(
                  child: const Text(
                      'View Photo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                    );
                  },
                )
            ),
          ],
        )
    );
  }

}