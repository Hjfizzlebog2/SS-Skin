import 'package:flutter/material.dart';
import 'package:ss_skin_project/dbOperations.dart';
import 'PhotoSubmission.dart';

enum Group1 { q1a1, q1a2, q1a3, q1a4 }
enum Group2 { q2a1, q2a2 }
enum Group3 { q3a1, q3a2, q3a3 }
enum Group4 { q4a1, q4a2 }

// class for the questionnaire screen
class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  QuestionnaireState createState() => QuestionnaireState();
}

class QuestionnaireState extends State<Questionnaire> {
  var g1Values = ['18-29', '30-49', '50-69', '70+'];
  var g2Values = ['Male', 'Female'];
  var g3Values = ['Low', 'Medium', 'High'];
  var g4Values = [true, false];

  Group1? g1 = Group1.q1a1;
  Group2? g2 = Group2.q2a1;
  Group3? g3 = Group3.q3a1;
  Group4? g4 = Group4.q4a1;

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
              padding: const EdgeInsets.all(15),
              child: const Text(
                '\nFirst, a bit about you...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'What is your age?',
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 15),
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
                const SizedBox(width: 11),
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
              padding: const EdgeInsets.all(8),
              child: const Text(
                'What is your gender?',
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 19),
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
                const SizedBox(width: 11),
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
              padding: const EdgeInsets.all(8),
              child: const Text(
                'What is the severity of your condition?',
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                    'Low',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 26),
                Text(
                    'Medium',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
                SizedBox(width: 22),
                Text(
                    'High',
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 11),
                Radio<Group3>(
                  value: Group3.q3a1,
                  groupValue: g3,
                  onChanged: (Group3? value) {
                    setState(() {
                      g3 = value;
                    });
                  },
                ),
                const SizedBox(width: 19),
                Radio<Group3>(
                  value: Group3.q3a2,
                  groupValue: g3,
                  onChanged: (Group3? value) {
                    setState(() {
                      g3 = value;
                    });
                  },
                ),
                const SizedBox(width: 17),
                Radio<Group3>(
                  value: Group3.q3a3,
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
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Has anyone else in your family experienced this?',
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 22),
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
                const SizedBox(width: 11),
                Radio<Group4>(
                  value: Group4.q4a1,
                  groupValue: g4,
                  onChanged: (Group4? value) {
                    setState(() {
                      g4 = value;
                    });
                  },
                ),
                const SizedBox(width: 22),
                Radio<Group4>(
                  value: Group4.q4a2,
                  groupValue: g4,
                  onChanged: (Group4? value) {
                    setState(() {
                      g4 = value;
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

                  String g3ReturnValue;
                  if (g3 == Group3.q3a1) {
                    g3ReturnValue = g3Values[0];
                  } else if (g3 == Group3.q3a2) {
                    g3ReturnValue = g3Values[1];
                  } else {
                    g3ReturnValue = g3Values[2];
                  }

                  bool g4ReturnValue;
                  if (g4 == Group4.q4a1) {
                    g4ReturnValue = g4Values[0];
                  } else {
                    g4ReturnValue = g4Values[1];
                  }

                  enterQuestionData(g1ReturnValue, g2ReturnValue, g3ReturnValue, g4ReturnValue);
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