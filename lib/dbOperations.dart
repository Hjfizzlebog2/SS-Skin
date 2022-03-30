import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/CreateAccount.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';

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

  //try {
  firebaseAuth
      .createUserWithEmailAndPassword(
      email: email.text, password: password.text)
      .then((result) {
    final docUser =
    FirebaseFirestore.instance.collection('User').doc(result.user?.uid);
    RegisteredHomePage.user = result.user as UserCredential;
    final json = {
      'firstName': fName.text,
      'lastName': lName.text,
      'email': email.text,
    };
    docUser.set(json);
  });
  // } on FirebaseAuthException catch (e) {
  //   print(e);
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
  // }
}

Future enterQuestionData(String userName, String age, String gender,
    String condition, bool genetic) async {
  final docUser =
  FirebaseFirestore.instance.collection('UserData').doc(userName);
  final json = {
    'age': age,
    'gender': gender,
    'condition': condition,
    'genetic': genetic,
  };

  await docUser.set(json);
}

Future uploadImage(File imageFile, String filePathName) async {
  final storeRef = FirebaseStorage.instance
      .ref()
      .child('$RegisteredHomePage.user/$filePathName');
  await storeRef.putFile(imageFile);
}

Future getUserImages() async {
  Image image;
  final storeRef =
  FirebaseStorage.instance.ref().child('$RegisteredHomePage.user/');
  final url = storeRef.getDownloadURL();
}

Future<void> editProduct(bool _isFavourite, String id) async {
  FirebaseFirestore.instance.collection('User');
  //var fireBaseUser = FirebaseAuth.instance.currentUser;
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection('User');
  //.document(doc.documentID)
  //.delete();
}