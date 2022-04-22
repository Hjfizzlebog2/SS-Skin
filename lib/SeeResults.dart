import 'package:flutter/material.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'Constants.dart' as Constants;

class SeeResults extends StatelessWidget {
  final Map scan;

  const SeeResults({
    Key? key,
    required this.scan,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => GeneratedReport(scan: scan))
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
        Container(
        alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'The Results are In',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
              color: Colors.white
            ),
          ),
        ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Tap to See Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            )
        ],
        ),
      )
    );
  }

}