import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';

Future signInUser(

    TextEditingController email, TextEditingController password, BuildContext context) async {
  try {

    RegisteredHomePage.user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email.text, password: password.text));

    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredHomePage()));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
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
      MaterialPageRoute(builder: (context) => const ScreeningBreakdown()));
   } catch(e) {
     if (kDebugMode) {
       print(e);
     }
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

Future enterResults( String condition, String date, String time, String probability) async {

  final doc = FirebaseFirestore.instance
      .collection('results')
      .doc(RegisteredHomePage.user.user?.uid)
      .collection('case').doc();

  String urlTime = time.replaceAll(':', '%3A');
  String url = 'https://firebasestorage.googleapis.com/v0/b/skin-safety-scanner/o/${RegisteredHomePage.user.user?.uid}%2F$date$urlTime?alt=media';
  final json =
  {"Condition": condition,
    "Date" : date,
    "Probability" : probability,
    "url": url,
    "DateTime" : '$date$time'};
  try{
    doc.set(json, SetOptions(merge: true));
  } catch(e)   {
    if (kDebugMode) {
      print(e);
    }
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

Future<bool> resetPassword(TextEditingController emailController) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    return false;
  } catch(e) {
    if (kDebugMode) {
      print(e);
    }
    return true;
  }
}