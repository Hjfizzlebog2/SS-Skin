import 'package:flutter/material.dart';
import 'package:skin_safety_scanner/RegisteredHomePage.dart';
import 'ScreeningBreakdown.dart';
import 'LogHistory.dart';

// class for the reset password screen
class RegisteredHomePage extends StatelessWidget {
  const RegisteredHomePage({Key? key}) : super(key: key);

  // TODO: Figure out how to emulate this page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Skin Safety Scanner"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisteredHomePage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey)),
                label: const Text("Back",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Reset\nPassword",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Reset Password",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey)),
              ),
            ),
          ],
        ));
  }
}
