import 'package:flutter/material.dart';
import 'package:ss_skin_project/PastResults.dart';

// class for the log history screen
class PreviousPhoto extends StatelessWidget {
  const PreviousPhoto({Key? key}) : super(key: key);

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
                'Previous Photos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Image.asset(
                'assets/images/registered_homepage.jpg',
                width: 300
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: TextButton(
                child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PastResults()),
                  );
                },
              )
            ),
          ],
        )
    );
  }
}