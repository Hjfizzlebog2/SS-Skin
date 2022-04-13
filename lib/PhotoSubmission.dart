import 'dart:io';
import 'dart:convert';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/ml/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ss_skin_project/ReviewPhotoScreen.dart';

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
                  // take picture with device's camera
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(Icons.navigate_next),
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
                  // pick from device's photo gallery
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(Icons.navigate_next),
                label: const Text(
                    'Choose From Device',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
          ],
        )
    );
  }

  // get from camera function
  _getFromCamera() async {
    final httpClient = await _googleSignIn.authenticatedClient();

    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }

    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);

    final request =
    {
      "instances": [{
        "content": img64
      }],
    };

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

      }
    });

    var endpoint = '5815105893074731008';
    var url = 'projects/skin-safety-scanner/locations/us-central1/endpoints/' + endpoint;

    final api = CloudMachineLearningEngineApi(httpClient!);
    // FIXME: should it be .fromJson?
    final predictRequest = GoogleCloudMlV1PredictRequest.fromJson(request);
    // var predict = api.projects.locations.endpoints.predict(predictRequest, url);

    print('\n\n\n\n\nPREDICT:');
    // print(predict);
    print('\nEND PREDICT\n\n\n\n\n');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }

  // get from gallery function
  _getFromGallery() async {
    final httpClient = await _googleSignIn.authenticatedClient();

    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }

    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);

    final request =
    {
      "instances": [{
        "content": img64
      }],
    };

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

      }
    });

    var endpoint = '5815105893074731008';
    var url = 'projects/skin-safety-scanner/locations/us-central1/endpoints/' + endpoint;

    final api = CloudMachineLearningEngineApi(httpClient!);
    // FIXME: should it be .fromJson?
    final predictRequest = GoogleCloudMlV1PredictRequest.fromJson(request);

    var predict = api.projects.predict(predictRequest, url);

    print('\n\n\n\n\nPREDICT:');
    print(predict);
    print('\nEND PREDICT\n\n\n\n\n');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }
}