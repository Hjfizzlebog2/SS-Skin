import 'package:flutter/material.dart';
import 'ScreeningBreakdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisteredHomePage(),
    );
  }
}

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
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Welcome Back!",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 36),
            ),
          ),
          Image.asset('images/homepage.jpg'),
          Container(
            padding: const EdgeInsets.all(15),
            width: 240,
            height: 90,
            child: ElevatedButton.icon(
              onPressed: () {
                //TODO: This is how to navigate to a new route (screen). Simply replace 'ScreeningBreakdown()' with whatever route you want to navigate to.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreeningBreakdown()),
                );
              },
              icon: const Icon(
                  Icons.add
              ),
              label: const Text("Create new entry",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: 240,
            height: 90,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                  Icons.add
              ),
              label: const Text("View log history",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
              ),
            ),
          ),
        ],
      )
    );
  }
}