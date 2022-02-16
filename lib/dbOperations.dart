import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore Firestore = FirebaseFirestore.instance;

Future<void> uploadingData(String fName, String lName,
    String email, String password) async {
  await FirebaseFirestore.instance.collection("User").add({
    'Fname': fName,
    'Lname': lName,
    'Email': email,
    'Password': password,
  });
}

Future<void> editProduct(bool _isFavourite,String id) async {
  await FirebaseFirestore.instance
      .collection("User");
      //.document(id)
      //.updateData({"isFavourite": !_isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  await FirebaseFirestore.instance
      .collection("User");
      //.document(doc.documentID)
      //.delete();
}
