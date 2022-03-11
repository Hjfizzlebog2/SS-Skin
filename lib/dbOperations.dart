import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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

Future<void> editProduct(bool _isFavourite, String id) async {
  FirebaseFirestore.instance.collection('User');
  //var fireBaseUser = FirebaseAuth.instance.currentUser;
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection('User');
  //.document(doc.documentID)
  //.delete();
}
