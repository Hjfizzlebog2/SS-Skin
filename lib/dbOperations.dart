import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ss_skin_project/CreateAccount.dart';

Future createUser (String userName, String name, String email, String password) async {
  await Firebase.initializeApp();
  final docUser = FirebaseFirestore.instance.collection('User').doc('test');
  final json = {
    'userName': userName,
    'name': name,
    'email': email,
    'password': password,
  };

  await docUser.set(json);
}

Future enterQuestionData(String userName, String age, String gender, String condition, bool genetic) async {
  await Firebase.initializeApp();
  final docUser = FirebaseFirestore.instance.collection('UserData').doc(userName);
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
