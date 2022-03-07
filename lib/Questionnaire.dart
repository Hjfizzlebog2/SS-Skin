import 'package:flutter/material.dart';
import 'PhotoSubmission.dart';

// class for the screening breakdown screen
class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  QuestionnaireState createState() => QuestionnaireState();
}

class QuestionnaireState extends State<Questionnaire> {
  Object? group = 1;

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
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                "What is your age?",
                style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
            Row(children: const [
              SizedBox(width: 15),
              Text(
                  "18-29",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 28),
              Text(
                  "30-49",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 28),
              Text(
                  "50-69",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 28),
              Text(
                  "70+",
                  style: TextStyle(fontSize: 15)),
            ],),
            Row(children: [
              const SizedBox(width: 11),
              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 19),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 17),
              Radio(
                value: 3,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 11),
              Radio(
                value: 4,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                "What is your gender?",
                style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
            Row(children: const [
              SizedBox(width: 19),
              Text(
                  "Male",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 25),
              Text(
                  "Female",
                  style: TextStyle(fontSize: 15)),
            ],),
            Row(children: [
              const SizedBox(width: 11),
              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 19),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                "What is your condition?",
                style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
            Row(children: const [
              SizedBox(width: 20),
              Text(
                  "Mole",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 31),
              Text(
                  "Rash",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 31),
              Text(
                  "Burn",
                  style: TextStyle(fontSize: 15)),
            ],),
            Row(children: [
              const SizedBox(width: 11),
              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 19),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 17),
              Radio(
                value: 3,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Has anyone else in your family experienced this?",
                style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
            Row(children: const [
              SizedBox(width: 22),
              Text(
                  "Yes",
                  style: TextStyle(fontSize: 15)),
              SizedBox(width: 47),
              Text(
                  "No",
                  style: TextStyle(fontSize: 15)),
            ],),
            Row(children: [
              const SizedBox(width: 11),
              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              const SizedBox(width: 22),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoSubmission()),
                  );
                },
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