import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ReviewPhotoScreen extends StatelessWidget {
  ReviewPhotoScreen(this.imagePath, this.imageFile, {Key? key})
      : super(key: key);

  final File imageFile;
  final String imagePath;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Safety Scanner'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: Image.asset('assets/images/errorImage.jpeg', height: 256, width: 256),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  child: Text("Save Images"),
                  onPressed: () async {
                    isLoading = true;

                    String userId = "V5UNxD0ot9e511GWNBdWwatiXJh1/";
                      String imageName = imagePath
                          .substring(imagePath.lastIndexOf("/"), imagePath.lastIndexOf("."))
                          .replaceAll("/", "");

                      final Directory systemTempDir = Directory.systemTemp;
                      final byteData = await rootBundle.load('assets/images/errorImage.jpeg');

                      final file =
                          File('${systemTempDir.path}/test.jpeg');
                      await file.writeAsBytes(byteData.buffer.asUint8List(
                          byteData.offsetInBytes, byteData.lengthInBytes));
                      TaskSnapshot snapshot = await FirebaseStorage.instanceFor(bucket: 'gs://skin-safety-scanner/')
                          .ref()
                          .child("$userId/test")
                          .putFile(file);
                      if (snapshot.state == TaskState.success) {
                        final String downloadUrl =
                            await snapshot.ref.getDownloadURL();
                        // await FirebaseFirestore.instance
                        //     .collection("results")
                        //     .add({"Condition": "test", "Date" : "test", "Probability" : "test", "url": downloadUrl});
//isLoading = false;

                        final snackBar =
                            SnackBar(content: Text('Yay! Success'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        print(
                            'Error from image repo ${snapshot.state.toString()}');
                        throw ('This file is not an image');
                      }
                    })
                  ),
        ],
      ),
    );
  }
}

// class _ReviewPhotoScreenState extends State<ReviewPhotoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Skin Safety Scanner'),
//     centerTitle: true,
//     backgroundColor: Colors.redAccent,
//     ),
//
//     );
//   }

// Builder(builder: (context) {
// return ElevatedButton(
// child: Text("Save Images"),
// onPressed: () {
// setState(() {
// this.isLoading = true;
// });
// listOfStr.forEach((img) async {
// String imageName = img!
//     .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
//     .replaceAll("/", "");
//
// final Directory systemTempDir = Directory.systemTemp;
// final byteData = await rootBundle.load(img);
//
// final file =
// File('${systemTempDir.path}/$imageName.jpeg');
// await file.writeAsBytes(byteData.buffer.asUint8List(
// byteData.offsetInBytes, byteData.lengthInBytes));
// TaskSnapshot snapshot = await storage
//     .ref()
//     .child("images/$imageName")
//     .putFile(file);
// if (snapshot.state == TaskState.success) {
// final String downloadUrl =
// await snapshot.ref.getDownloadURL();
// await FirebaseFirestore.instance
//     .collection("images")
//     .add({"url": downloadUrl, "name": imageName});
// setState(() {
// isLoading = false;
// });
// final snackBar =
// SnackBar(content: Text('Yay! Success'));
// ScaffoldMessenger.of(context).showSnackBar(snackBar);
// } else {
// print(
// 'Error from image repo ${snapshot.state.toString()}');
// throw ('This file is not an image');
// }
// });
// });
// }),
