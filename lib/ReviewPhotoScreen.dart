import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cache_manager/cache_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:ss_skin_project/dbOperations.dart';

import 'GeneratedReport.dart';


class ReviewPhotoScreen extends StatelessWidget {
  ReviewPhotoScreen(this.imagePath, this.imageFile, this.reportMap, {Key? key})
      : super(key: key);

  final File imageFile;
  final String imagePath;
  bool isLoading = false;
  var progress;
  Map reportMap;

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
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: Image.file(imageFile, width: 256, height: 256)
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text("Save Image"),
                onPressed: () async {
                  isLoading = true;


                    String? userId = RegisteredHomePage.user.user?.uid;

                    final bytes = imageFile.readAsBytesSync();
                    DateTime now = DateTime.now();
                    var date = DateFormat("dd-MM-yyy").format(now);
                    var time = "-${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";


                  TaskSnapshot snapshot = await FirebaseStorage.instanceFor(bucket: 'gs://skin-safety-scanner/')
                        .ref()
                        .child("$userId//$date$time")
                       .putData(bytes);

                   // if (snapshot.state == TaskState.success) {

                      enterResults("condition", date, time, "probability", snapshot.ref.getDownloadURL() as String);
                      final snackBar =
                          SnackBar(content: Text('Yay! Success'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // } else {
                    //   print(
                    //       'Error from image repo ${snapshot.state.toString()}');
                    //   throw ('This file is not an image');
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
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
              MaterialPageRoute(builder: (context) =>  GeneratedReport(scan: reportMap)),
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
        ),
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
