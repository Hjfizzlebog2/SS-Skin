import 'package:flutter/material.dart';
import 'package:ss_skin_project/PastResults.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';

// class for the log history screen
class LogHistory extends StatelessWidget {
  const LogHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Log History',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Image.asset(
              'assets/images/log_history.jpg',
              width: 300
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
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'View Previous Photos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
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
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'View Past Results',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              ),
            ),
          ],
        )
    );
  }
}