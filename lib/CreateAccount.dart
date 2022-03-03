import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/dbOperations.dart';

// class for the registered home page screen
class CreateAccount extends StatelessWidget {
  List<TextEditingController> controller = [TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController()];
  CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Safety Scanner"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: const Text(
              "Create Account",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 34),
            ),
          ),
          Flexible (
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    onChanged: (text) async {
                      try {
                        var collectionRef = FirebaseFirestore.instance.collection("User");
                        var doc = await collectionRef.doc(text).get();

                        doc.exists;

                      } catch(e) {
                        throw e;
                      }
                    },
                    controller: controller.elementAt(0),
                    maxLength: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter a Username',
                      // errorText: docExists ? true: "Username Taken"
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller.elementAt(1),
                    maxLength: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      hintText: 'Enter Your Last Name',
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller.elementAt(2),
                    maxLength: 25,
                    //inputFormatters: [
                    //  FilteringTextInputFormatter.allow(RegExp(r'^(.+)@(.+)$'))
                    //  ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller.elementAt(3),
                    maxLength: 20,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter a Password',
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: 270,
            height: 90,
            child: ElevatedButton.icon(
              onPressed: () {
                final userName = controller.elementAt(0).text;
                final name = controller.elementAt(1).text;
                final email = controller.elementAt(2).text;
                final pass = controller.elementAt(3).text;

                createUser(userName, name, email, pass);
              },
              icon: const Icon(Icons.add),
              label: const Text("Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey)),
            ),
          ),
        ],
      ),
    );
  }
}