import 'package:flutter/material.dart';
import 'package:ss_skin_project/FurtherDetailsMelanoma.dart';
import 'package:ss_skin_project/NextStepsMelanoma.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';
import 'package:ss_skin_project/ZipCodeCollection.dart';

import 'Constants.dart' as Constants;
import 'LogHistory.dart';
import 'RegisteredHomePage.dart';

class WhatNow extends StatelessWidget {

  const WhatNow({
    Key? key,
  }) : super(key: key);

  static const screenColor = Constants.Constants.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Skin Safety Scanner'),
            centerTitle: true,
            backgroundColor: screenColor,
            automaticallyImplyLeading: false,
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
        // backgroundColor: screenColor,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhatNow())
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
                  'Next Steps For You',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.black
                  ),
                ),
              ),
              //Image.asset('assets/images/next_steps.jpg',scale: 0.3,),
              Container(
                padding: const EdgeInsets.all(15),
                width: 270,
                height: 90,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PhotoSubmission()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                  ),
                  icon: const Icon(Icons.navigate_next),
                  label: const Text(
                      'Scan Again',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
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
                      MaterialPageRoute(builder: (context) => const LogHistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                  ),
                  icon: const Icon(Icons.navigate_next),
                  label: const Text(
                      'See Past Scans',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
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
                      MaterialPageRoute(builder: (context) => const ZipCodeCollection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                  ),
                  icon: const Icon(Icons.navigate_next),
                  label: const Text(
                      'Find Nearby Doctors',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
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
                      MaterialPageRoute(builder: (context) => const FurtherDetailsMelanoma()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                  ),
                  icon: const Icon(Icons.navigate_next),
                  label: const Text(
                      'Hear More About Melanoma',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

}