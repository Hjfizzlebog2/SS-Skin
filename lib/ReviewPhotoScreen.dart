import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ss_skin_project/dbOperations.dart';
import 'Constants.dart';
import 'GeneratedReport.dart';
import 'SeeResults.dart';

class ReviewPhotoScreen extends StatelessWidget {

  final String imagePath;
  final File imageFile;
  final String q1;
  final String q2;
  final bool q3;
  bool isLoading = false;
  var progress;
  Map reportMap;

  ReviewPhotoScreen(this.imagePath, this.imageFile, this.reportMap, this.q1, this.q2, this.q3, {Key? key})
      : super(key: key);

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        title: const Text('Skin Safety Scanner',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
          )
        ),
        iconTheme: const IconThemeData(
          color: textColor,
        ),
        centerTitle: true,
        backgroundColor: screenColor,
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
                    style: TextStyle(fontSize: 22, color: textColor),
                  ),
                ),
                onPressed: () async {
                  isLoading = true;

                  DateTime now = DateTime.now();
                  var date = DateFormat("dd-MM-yyy").format(now);
                  // reportMap = TitleSplashScreen.reportMap;
                  //This should be commented out or removed when endpoint is deployed

                  try {
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  } finally {
                    enterResults("Melanoma", date, (reportMap.entries.elementAt(0).value * 100).toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeeResults(scan: reportMap,
                              q1: q1, q2: q2, q3: q3)),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    elevation: Constants.buttonElevation),
              )
          ),
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
