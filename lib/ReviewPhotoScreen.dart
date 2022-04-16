import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';

import 'GeneratedReport.dart';


class ReviewPhotoScreen extends StatelessWidget {
  ReviewPhotoScreen(this.imagePath, this.imageFile, this.map, {Key? key}) : super(key: key);
  
  final Map map;
  final File imageFile;
  final String imagePath;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Safety Scanner'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: Image.file(imageFile, width: 410, height: 410)
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 40),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () async {
                  isLoading = true;

                  String? userId = RegisteredHomePage.user.user?.uid;
                    String imageName = imagePath
                        .substring(imagePath.lastIndexOf("/"), imagePath.lastIndexOf("."))
                        .replaceAll("/", "");

                    final Directory systemTempDir = Directory.systemTemp;
                    // FIXME: "Unhandled Exception: Unable to load asset: /data/user/0/com.example.ss_skin_project/cache/50a3b3d6-1c79-4acb-8692-60fa94645ac59177760667377750289.jpg"
                    final byteData = await rootBundle.load(imagePath);

                    final file =
                        File('${systemTempDir.path}/$imageName.jpeg');
                    await file.writeAsBytes(byteData.buffer.asUint8List(
                        byteData.offsetInBytes, byteData.lengthInBytes));
                    TaskSnapshot snapshot = await FirebaseStorage.instanceFor(bucket: 'gs://skin-safety-scanner/')
                        .ref()
                        .child("$userId//$imageName")
                        .putFile(file);
                    if (snapshot.state == TaskState.success) {
                      final String downloadUrl =
                          await snapshot.ref.getDownloadURL();
                      // await FirebaseFirestore.instance
                      //     .collection("results")
                      //     .add({"Condition": "test", "Date" : "test", "Probability" : "test", "url": downloadUrl});
                      //isLoading = false;

                      const snackBar =
                          SnackBar(content: Text('Yay! Success'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      print(
                          'Error from image repo ${snapshot.state.toString()}');
                      throw ('This file is not an image');
                    }

                  },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(
                    Icons.save_alt
                ),
                label: const Text(
                    'Save Image',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GeneratedReport(scan: map)),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                label: const Text(
                    'Scan Photo',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                ),
                icon: const Icon(Icons.navigate_next),
              )
          )
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
