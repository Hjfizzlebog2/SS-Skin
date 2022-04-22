import 'dart:io';
import 'dart:convert';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ss_skin_project/ReviewPhotoScreen.dart';
import 'Constants.dart';
import 'VertexReport.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/cloud-vision',
    'https://www.googleapis.com/auth/cloud-platform.read-only'
  ],
);

// class for the photo submission screen
class PhotoSubmission extends StatefulWidget {
  const PhotoSubmission({Key? key}) : super(key: key);

  @override
  _PhotoSubmissionState createState() => _PhotoSubmissionState();
}

class _PhotoSubmissionState extends State<PhotoSubmission> {
  late File imageFile;

  static const screenColor = Constants.cyan2;
  static const buttonColor = Constants.cyan2Accent;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(
            title: const Text('Skin Safety Scanner',
                style: TextStyle(
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
          iconTheme: const IconThemeData(
            color:textColor,
          )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Let\'s Take a Photo!',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Material(
                elevation: Constants.pfpElevation,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/NewPhotoSubmission.png',
                  height: 230,
                  width: 230,
                  fit: BoxFit.fitWidth,
                )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  processImage('camera');
                },
                style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                ),
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'Use Camera',
                    style: TextStyle(
                        color: textColor,
                        //fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  processImage('gallery');
                },
                style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                ),
                icon: const Icon(Icons.navigate_next, color: textColor),
                label: const Text(
                    'Choose From Gallery',
                    style: TextStyle(
                      color: textColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
          ],
        )
    );
  }

  processImage(String input) async {
    try {
      _googleSignIn.signIn();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }

    GoogleSignInAccount? _currentUser;

    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        if (kDebugMode) {
          print(_currentUser?.displayName);
        }
      }
    });

    final httpClient = await _googleSignIn.authenticatedClient();

    final ImagePicker _picker = ImagePicker();

    if (input == 'camera') {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } else {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);

    String endpoint = '4859639084630409216';
    Uri url = Uri.parse('https://us-central1-aiplatform.googleapis.com/v1/projects/skin-safety-scanner/locations/us-central1/endpoints/' + endpoint + ':predict');

    Map<String, String> headers = {
      "Accept": "application/json"
    };

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile, Map())),
    );

    Map body =
    {
      "instances": [{
        "content": img64
      }],
    };
    String bodyJson = json.encode(body);

    var response = await httpClient?.post(url, headers: headers, body: bodyJson);

    //Get JSON response to GeneratedReport Screen

    //STEP 1: Create a VertexReport object [COMPLETE]
    VertexReport vertexReport = VertexReport.fromJson(jsonDecode(response!.body));

    //STEP 2: Create a map out of the VertexReport object [COMPLETE]
    Map reportMap = {
      vertexReport.predictions![0].displayNames![1] : vertexReport.predictions![0].confidences![1],
      vertexReport.predictions![0].displayNames![0] : vertexReport.predictions![0].confidences![0]
    };
    //^ The above is the definition and instantiation of a map that stores two key : value  pairs
    // Line 180 is "Melanoma" : 0.927947293824 (an example percentage in decimal form)
    // Line 181 is "Not_Melanoma" : 0.07205270617
    // So reportMap is just a normal map of two elements. But I do something different
    // it on GeneratedReport to make it more usable.

    /*
    // Use below code in case that you want to skip over the ReviewPhotoScreen
    //STEP 3: Pass map to GeneratedReport

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GeneratedReport(scan: reportMap)),
    );

     */

    //STEP 4: Map gets passed to ReviewPhotoScreen, and then on to GeneratedReport

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile, reportMap)),
    );
  }
}