import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;

Future<void> uploadingData(String firstName, String lastName,
    String email, String password) async {
  await FirebaseFirestore.instance.collection("User").add({
    'firstName': firstName,
    'lastName': lastName,
    'Email': email,
    'Password': password,
  });
}

Future<void> editProduct(bool _isFavourite,String id) async {
  FirebaseFirestore.instance
      .collection("User");
      //.document(id)
      //.updateData({"isFavourite": !_isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  FirebaseFirestore.instance
      .collection("User");
      //.document(doc.documentID)
      //.delete();
}