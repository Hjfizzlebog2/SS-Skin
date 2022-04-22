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
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: Image.file(imageFile, width: 360, height: 360),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Container(
                  width: 150,
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    "Save Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                onPressed: () async {
                  isLoading = true;

                  String? userId = RegisteredHomePage.user.user?.uid;

                  final bytes = imageFile.readAsBytesSync();
                  DateTime now = DateTime.now();
                  var date = DateFormat("dd-MM-yyy").format(now);
                  var time =
                      "-${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

                  String url = "";
                  try {
                      url = uploadImage(bytes) as String;
                      // var ref = FirebaseStorage.instanceFor(
                      //       bucket: 'gs://skin-safety-scanner/')
                      //   .ref()
                      //   .child("$userId//$date$time");
                      // ref.putData(bytes);
                      //  url = await ref.getDownloadURL();
                  } catch (e) {
                    print(e);
                  } finally {
                    enterResults("condition", date, time, "probability", url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneratedReport(scan: reportMap)),
                    );
                  }


                },
                style: ElevatedButton.styleFrom(primary: Colors.cyan[600]),
              )),
          // Container(
          //   child: AnimatedPositioned(
          //     bottom: 80,
          //       height: 200,
          //       left:200,
          //       duration: Duration(microseconds: 200),
          //       child: Image.asset("assets/images/title_picture.gif", width: 50, height: 50),
          //   )
          //
          // ),
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
