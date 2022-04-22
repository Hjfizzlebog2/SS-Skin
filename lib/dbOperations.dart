import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ss_skin_project/CreateAccount.dart';
import 'package:ss_skin_project/LogInScreen.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';

Future signInUser(

    TextEditingController email, TextEditingController password, BuildContext context) async {
  try {

    RegisteredHomePage.user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email.text, password: password.text));

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisteredHomePage()));
  } catch (e) {
    print(e);
  }
}

Future createUser(
    TextEditingController fName,
    TextEditingController lName,
    TextEditingController email,
    TextEditingController password,
    BuildContext context) async {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  try {
  firebaseAuth
      .createUserWithEmailAndPassword(
      email: email.text, password: password.text)
      .then((result) {
    final docUser =
    FirebaseFirestore.instance.collection('User').doc(result.user?.uid);
    RegisteredHomePage.user = result;
    final json = {
      'firstName': fName.text,
      'lastName': lName.text,
      'email': email.text,
    };
    docUser.set(json);
  });
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ScreeningBreakdown()));
   } catch(e) {
     print(e);
  //   AlertDialog(
  //     title:
  //         Text('Error Creating Account'), // To display the title it is optional
  //     content: Text(e.toString()), // Message which will be pop up on the screen
  //     // Action widget which will provide the user to acknowledge the choice
  //     actions: [
  //       FlatButton(
  //         textColor: Colors.black,
  //         onPressed: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => CreateAccount()));
  //         },
  //         child: Text('Okay'),
  //       ),
  //     ],
  //   );
   }
}

Future enterQuestionData(String age, String gender,
    bool genetic) async {
  final docUser =
  FirebaseFirestore.instance.collection('UserData').doc(RegisteredHomePage.user.user?.uid);
  final json = {
    'age': age,
    'gender': gender,
    'genetic': genetic,
  };

  await docUser.set(json);
}

Future enterResults( String condition, String date, String time, String probability, String url ) async {

  final doc = FirebaseFirestore.instance
      .collection('results')
      .doc(RegisteredHomePage.user.user?.uid)
      .collection('case').doc();

  final json =
  {"Condition": "Melanoma",
    "Date" : "$date$time",
    "Probability" : "TODO",
    "url": url};
  try{
    doc.set(json, SetOptions(merge: true));
  } catch(e)   {
    print(e);
  }


}
Future uploadImage(final bytes) async {
  String? userId = RegisteredHomePage.user.user?.uid;

  DateTime now = DateTime.now();
  var date = DateFormat("dd-MM-yyy").format(now);
  var time =
      "-${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

  var ref = FirebaseStorage.instanceFor(
      bucket: 'gs://skin-safety-scanner/')
      .ref()
      .child("$userId//$date$time");
  TaskSnapshot snapshot = await ref.putData(bytes);
  final url = await snapshot.ref.getDownloadURL();
  return url;
}
Future getUserImages() async {
  Image image;
  final storeRef =
  FirebaseStorage.instance.ref().child('$RegisteredHomePage.user/');
  final url = storeRef.getDownloadURL();
}

Future<bool> resetPassword(TextEditingController emailController) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    return false;
  } catch(e) {
    print(e);
    return true;
  }
}