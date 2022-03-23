import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/CreateAccount.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';

Future createUser(
    TextEditingController fName, TextEditingController lName, TextEditingController email, TextEditingController password) async {
  await Firebase.initializeApp();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  firebaseAuth
      .createUserWithEmailAndPassword(email: email.text, password: password.text)
      .then((result) {
    final docUser = FirebaseFirestore.instance.collection('User').doc(result.user?.uid);
    RegisteredHomePage.user = result.user;
    final json = {
      'firstName': fName.text,
      'lastName': lName.text,
      'email': email.text,
    };

    docUser.set(json);
  });

  //ADD ERROR MESSAGE
}

Future enterQuestionData(String userName, String age, String gender,
    String condition, bool genetic) async {
  await Firebase.initializeApp();
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

Future<void> editProduct(bool _isFavourite, String id) async {
  FirebaseFirestore.instance.collection('User');
  //var fireBaseUser = FirebaseAuth.instance.currentUser;
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection('User');
  //.document(doc.documentID)
  //.delete();
}
