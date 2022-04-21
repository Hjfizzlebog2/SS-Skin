import 'package:flutter/material.dart';
import 'package:ss_skin_project/dbOperations.dart';
import 'PhotoSubmission.dart';

enum Group1 { q1a1, q1a2, q1a3, q1a4 }
enum Group2 { q2a1, q2a2 }
enum Group3 { q3a1, q3a2 }

// class for the questionnaire screen
class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  QuestionnaireState createState() => QuestionnaireState();
}

class QuestionnaireState extends State<Questionnaire> {
  var g1Values = ['18-29', '30-49', '50-69', '70+'];
  var g2Values = ['Male', 'Female'];
  var g3Values = [true, false];

  static const titleInset = 25;
  static const labelInset = titleInset - 5;

  Group1? g1 = Group1.q1a1;
  Group2? g2 = Group2.q2a1;
  Group3? g3 = Group3.q3a1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(titleInset * 1.0, titleInset * 1.0, titleInset * 1.0, titleInset - 10), // * 1.0 since needs to be double
              child: const Text(
                '\nFirst, a bit about you...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(labelInset * 1.0),
              child: const Text(
                'What is your age?',
                style: TextStyle(
                    fontSize: 20,
                    //decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width:titleInset + 11),
                Text(
                    '18-29',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 28),
                Text(
                    '30-49',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 28),
                Text(
                    '50-69',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 28),
                Text(
                    '70+',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                Radio<Group1>(
                  value: Group1.q1a1,
                  groupValue: g1,
                  onChanged: (Group1? value) {
                    setState(() {
                      g1 = value;
                    });
                  },
                ),
                const SizedBox(width: 19),
                Radio<Group1>(
                  value: Group1.q1a2,
                  groupValue: g1,
                  onChanged: (Group1? value) {
                    setState(() {
                      g1 = value;
                    });
                  },
                ),
                const SizedBox(width: 17),
                Radio<Group1>(
                  value: Group1.q1a3,
                  groupValue: g1,
                  onChanged: (Group1? value) {
                    setState(() {
                      g1 = value;
                    });
                  },
                ),
                const SizedBox(width: 11),
                Radio<Group1>(
                  value: Group1.q1a4,
                  groupValue: g1,
                  onChanged: (Group1? value) {
                    setState(() {
                      g1 = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(titleInset * 1.0 - 1),
              child: const Text(
                'What is your gender?',
                style: TextStyle(
                    fontSize: 20,
                   // decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: labelInset + 18),
                Text(
                    'Male',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 25),
                Text(
                    'Female',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: labelInset + 11 * 1.0),
                Radio<Group2>(
                  value: Group2.q2a1,
                  groupValue: g2,
                  onChanged: (Group2? value) {
                    setState(() {
                      g2 = value;
                    });
                  },
                ),
                const SizedBox(width: 19),
                Radio<Group2>(
                  value: Group2.q2a2,
                  groupValue: g2,
                  onChanged: (Group2? value) {
                    setState(() {
                      g2 = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(labelInset + 2 * 1.0),
              child: const Text(
                'Any relevant family history?',
                style: TextStyle(
                    fontSize: 20,
                 //TODO: could make bold
                 //   decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: labelInset + 23),
                Text(
                    'Yes',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 47),
                Text(
                    'No',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: labelInset + 10),
                Radio<Group3>(
                  value: Group3.q3a1,
                  groupValue: g3,
                  onChanged: (Group3? value) {
                    setState(() {
                      g3 = value;
                    });
                  },
                ),
                const SizedBox(width: 22),
                Radio<Group3>(
                  value: Group3.q3a2,
                  groupValue: g3,
                  onChanged: (Group3? value) {
                    setState(() {
                      g3 = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  String g1ReturnValue;
                  if (g1 == Group1.q1a1) {
                    g1ReturnValue = g1Values[0];
                  } else if (g1 == Group1.q1a2) {
                    g1ReturnValue = g1Values[1];
                  } else if (g1 == Group1.q1a3) {
                    g1ReturnValue = g1Values[2];
                  } else {
                    g1ReturnValue = g1Values[3];
                  }

                  String g2ReturnValue;
                  if (g2 == Group2.q2a1) {
                    g2ReturnValue = g2Values[0];
                  } else {
                    g2ReturnValue = g2Values[1];
                  }

                  bool g3ReturnValue;
                  if (g3 == Group3.q3a1) {
                    g3ReturnValue = g3Values[0];
                  } else {
                    g3ReturnValue = g3Values[1];
                  }

                  enterQuestionData(g1ReturnValue, g2ReturnValue, g3ReturnValue);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PhotoSubmission()),
                  );
                },
                icon: const Icon(Icons.navigate_next),
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                label: const Text(
                    'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            )
          ],
        )
    );
  }
}