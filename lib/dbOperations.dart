import 'package:cloud_firestore/cloud_firestore.dart';


Future createUser(
    String fName, String lName, String email, String password) async {
      final docUser = FirebaseFirestore.instance.collection("User").doc('test');
      final json = {
        'Fname': fName,
        'Lname': lName,
        'Email': email,
        'Password': password,
      };

      await docUser.set(json);
}

Future<void> editProduct(bool _isFavourite, String id) async {
  FirebaseFirestore.instance.collection("User");
  //var fireBaseUser = FirebaseAuth.instance.currentUser;
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection("User");
  //.document(doc.documentID)
  //.delete();
}
