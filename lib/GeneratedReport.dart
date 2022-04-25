import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Constants.dart';
import 'ThatMeans.dart';
import 'dbOperations.dart';

class GeneratedReport extends StatefulWidget {
  final Map scan;
  final String q1;
  final String q2;
  final bool q3;

  const GeneratedReport({
        Key? key,
    required this.scan,
    required this.q1,
    required this.q2,
    required this.q3
  }) : super(key: key);


  @override
  State<GeneratedReport> createState() => _GeneratedReportState();
}

class _GeneratedReportState extends State<GeneratedReport> {
  get mapList => widget.scan.entries.toList();
  get q1 => widget.q1;
  get q2 => widget.q2;
  get q3 => widget.q3;
  //Above, I am declaring a variable named mapList which turns the Map (called scan) into a usable list

  static const backgroundColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;
  static const percentageColor = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var date = DateFormat("dd-MM-yyy").format(now);
    var time = "-${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

    double percentage = (mapList[0].value * 100); // Melanoma percentage
    String percentageString = '';
    String condition = mapList[0].key; // Melanoma
    //(mapList[1].value * 100).toStringAsFixed(3) // Not_Melanoma Percentage (Ex: 92.783%)
    //mapList[1].key // "Not_Melanoma"

    if (q1.toString() == '18-29') {
      if (q2.toString() == 'Male') {
        percentage -= 6;
      } else {
        percentage -= 3;
      }
    } else if (q1 == '30-49') {
      if (q2.toString() == 'Male') {
        percentage -= 3;
      }
    } else if (q1 == '50-69') {
      if (q2.toString() == 'Male') {
        percentage += 4;
      } else {
        percentage += 2;
      }
    } else if (q1 == '70+') {
      if (q2.toString() == 'Male') {
        percentage += 6;
      } else {
        percentage += 3;
      }
    }
    if (q3) {
      percentage += 8;
    }

    percentageString = percentage.toStringAsFixed(2);

    if (percentage > 99.0) {
      percentageString = '> 99';
    } else if (percentage < 1.0) {
      percentageString = '< 1';
    }

    enterResults("Melanoma", date, time, percentageString);

    return Scaffold(
      backgroundColor: backgroundColor,
        /*
        //DO NOT NEED
        appBar: AppBar(
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  color: textColor,
                )),
          centerTitle: true,
          backgroundColor: buttonColor,
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
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ]
        ),
        */
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThatMeans(scan: widget.scan))
              );
            },
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: const Text(
                      'Your image displayed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor,
                          //fontWeight: FontWeight.bold,
                          fontSize: 34
                      )
                  )
              ),
              //MELANOMA
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                  child: Text(
                      percentageString + '%',
                      style: const TextStyle(
                          color: percentageColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 35
                      )
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
                  child: Text(
                    'similarity with images of positive cases of ' + condition + '.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: textColor),
                  )
              ),

              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tap to Continue',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor
                  ),
                ),
              ),
            ],
          )
        )
    );
  }
}



/*
//Extra Container for a "So What does that mean?"
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'So what does that mean?',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textColor
                  ),
                ),
              ),
            */