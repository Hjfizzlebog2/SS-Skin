import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;
CollectionReference users = fireStore.collection('User');

Future<void> uploadingData(
    String fName, String lName, String email, String password) async {
  return users
      .add({
        'Fname': fName,
        'Lname': lName,
        'Email': email,
        'Password': password,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> editProduct(bool _isFavourite, String id) async {
  FirebaseFirestore.instance.collection("User");
  //.document(id)
  //.updateData({"isFavourite": !_isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection("User");
  //.document(doc.documentID)
  //.delete();
}
