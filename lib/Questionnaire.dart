import 'package:flutter/material.dart';

// class for the screening breakdown screen
class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  QuestionnaireState createState() => QuestionnaireState();
}

class QuestionnaireState extends State<Questionnaire> {
  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Skin Safety Scanner"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "\nFirst, a bit about you:",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "• What is your age?",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Radio(
              value: 1,
              groupValue: group,
              onChanged: (T) {
                // setState(() {
                //   group = T;
                // });
              },
            ),
            Radio(
              value: 2,
              groupValue: group,
              onChanged: (T) {
                // setState(() {
                //   group = T;
                // });
              },
            ),
            Radio(
              value: 3,
              groupValue: group,
              onChanged: (T) {
                // setState(() {
                //   group = T;
                // });
              },
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "• What is your gender?",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "• What is your condition?",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "• Has anyone else in your family experienced this?",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                    Icons.add
                ),
                label: const Text("Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              ),
            )
          ],
        )
    );
  }
}