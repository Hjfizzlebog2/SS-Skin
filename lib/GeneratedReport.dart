import 'package:flutter/material.dart';
import 'Constants.dart';
import 'FurtherDetailsMelanoma.dart';
import 'RegisteredHomePage.dart';
import 'ThatMeans.dart';

class GeneratedReport extends StatefulWidget {
  final Map scan;
  // var _list = _scan.values.toList(); // <- Doesn't work
  
  const GeneratedReport({
        Key? key,
    required this.scan,
  }) : super(key: key);


  @override
  State<GeneratedReport> createState() => _GeneratedReportState();
}

class _GeneratedReportState extends State<GeneratedReport> {
  get mapList => widget.scan.entries.toList();
  //Above, I am declaring a variable named mapList which turns the Map (called scan) into a usable list

  static const backgroundColor = Constants.amber;
  static const buttonColor = Constants.amberAccent;
  static const textColor = Colors.black;
  static const percentageColor = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String percentage = (mapList[0].value * 100).toStringAsFixed(2); // Melanoma percentage
    String condition = mapList[0].key; // Melanoma
    //(mapList[1].value * 100).toStringAsFixed(3) // Not_Melanoma Percentage (Ex: 92.783%)
    //mapList[1].key // "Not_Melanoma"

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
                      percentage + '%',
                      style: const TextStyle(
                          color: percentageColor,
                          // fontWeight: FontWeight.bold,
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


// OLD PDF GENERATOR CONTAINER
/*
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ElevatedButton.icon(
                    onPressed: () {
                      //TEMPORARY CODE - REPLACE WITH REPORT GENERATION
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GeneratedReport()));
                      // END TEMPORARY CODE
                    },
                    label: const Text(
                        'Generate PDF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )
                    ), icon: const Icon(Icons.print)
                )
            ),
 */