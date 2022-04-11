import 'dart:io';
import 'dart:convert';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/ml/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ss_skin_project/ReviewPhotoScreen.dart';
import 'package:ss_skin_project/ReviewPhotoScreen.dart';

// FIXME: Google sign-in - make it automatic?
final GoogleSignIn _googleSignIn = GoogleSignIn(
scopes: <String>[
'https://www.googleapis.com/auth/cloud-platform',
'https://www.googleapis.com/auth/cloud-vision',
],
);

var httpClient = _googleSignIn.authenticatedClient();

// class for the photo submission screen
class PhotoSubmission extends StatefulWidget {
  const PhotoSubmission({Key? key}) : super(key: key);

  @override
  _PhotoSubmissionState createState() => _PhotoSubmissionState();
}

class _PhotoSubmissionState extends State<PhotoSubmission> {
  late File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
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
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Image.asset(
                'assets/images/photo_submission.jpg',
                height: 160,
                width: 160
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  _getFromCamera();
                  // pick from device camera function
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'Use Camera',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                  _getFromGallery();
                  // pick from device camera roll function
                },
                icon: const Icon(
                    Icons.add
                ),
                label: const Text(
                    'Choose From Device',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey)
                ),
              ),
            ),
          ],
        )
    );
  }

  // get from gallery function
  _getFromGallery() async {
    // FIXME: google sign in: works? I want it to be automatic
    // try {
    //   await _googleSignIn.signIn();
    // } catch (error) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // }

    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }

    // TODO: converting image to file, then to base64 and sending through Google API
    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);
    print('\n\n\n\n\n\n\n\n' + img64.substring(0, 100) + '\n\n\n\n\n\n\n\n');

    final request =
      {
        "instances": [{
          "content": img64
        }],
        "parameters": {
          "confidenceThreshold": 0.5,
          "maxPredictions": 5
        }
      };

    json.encode(request);

    var x = GoogleCloudMlV1PredictRequest.fromJson(request);
    print('\n\n\n\n\nPRINT RETURN VALUE:');
    print(x);
    print('DONE PRINTING\n\n\n\n\n\n');


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }

  // get from camera function
  _getFromCamera() async {
    // FIXME: google sign in: works? I want it to be automatic
    // try {
    //   await _googleSignIn.signIn();
    // } catch (error) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // }

    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }

    // TODO: converting image to file, then to base64 and sending through Google API
    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);
    print('\n\n\n\n\n\n\n\nIMG64:\n' + img64.substring(0, 100) + '\nENDSTRING\n\n\n\n\n\n\n\n');

    final request =
      {
        "instances": [{
          "content": img64
        }],
        "parameters": {
          "confidenceThreshold": 0.5,
          "maxPredictions": 5
        }
      };

    json.encode(request);

    GoogleCloudMlV1PredictRequest.fromJson(request);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }
}