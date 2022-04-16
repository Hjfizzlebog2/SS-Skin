import 'package:flutter/material.dart';
import 'FurtherDetailsMelanoma.dart';

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



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var _list = _scan.values.toList() FIXME
    String percentage = (mapList[0].value * 100).toStringAsFixed(3);
    String condition = mapList[0].key;

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
                padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                child: const Text(
                    'Your image displayed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )
                )
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
                child: Text(
                  'similarity with images of positive cases of ' + condition + '.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )
            ),

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                  label: const Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  icon: const Icon(Icons.navigate_next),
                )
            )
          ],
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