import 'package:flutter/material.dart';

// class for the registered home page screen
class RegisteredHomePage extends StatelessWidget {
  const RegisteredHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Skin Safety Scanner"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Welcome Back!",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 50),
              ),
            ),
            Image.asset('assets/homepage.jpg'),
            Container(
              padding: const EdgeInsets.all(50.0),
              color: Colors.cyan,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                    Icons.add
                ),
                label: const Text("Create new entry"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50.0),
              color: Colors.cyan,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                    Icons.add
                ),
                label: const Text("View log history"),
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