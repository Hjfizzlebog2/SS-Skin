import 'package:flutter/material.dart';
import 'FurtherDetailsMelanoma.dart';

class GeneratedReport extends StatefulWidget {
  const GeneratedReport({Key? key}) : super(key: key);

  @override
  State<GeneratedReport> createState() => _GeneratedReportState();
}

class _GeneratedReportState extends State<GeneratedReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                child: const Text(
                    'Report',
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
                child: const Text(
                    '84.7% Match',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )
                )
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
                child: const Text(
                  'Your uploaded image displayed 84.7% similarity with images of positive cases of Melanoma.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )
            ),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FurtherDetailsMelanoma()),
                    );
                  },
                  label: const Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  icon: const Icon(Icons.navigate_next),
                )
            ),
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
            )
          ],
        )
    );
  }
}