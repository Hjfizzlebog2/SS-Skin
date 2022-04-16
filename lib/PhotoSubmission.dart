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

                      _getFromCamera();
                      // take picture with device's camera
                    }
                  });
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

                      _getFromGallery();
                      // pick from device's photo gallery
                    }
                  });
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

    // final request =
    // {
    //   "instances": [{
    //     "content": img64
    //   }],
    // };
    // final api = CloudMachineLearningEngineApi(httpClient!);
    // FIXME: should it be .fromJson?
    // final predictRequest = GoogleCloudMlV1PredictRequest.fromJson(request);
    // var endpoints = 'us-central1-aiplatform.googleapis.com';
    // var predict = api.projects.locations.endpoints.predict();


    String endpoint = '3866595366795214848';
    Uri url2 = Uri.parse('https://us-central1-aiplatform.googleapis.com/v1/projects/skin-safety-scanner/locations/us-central1/endpoints/' + endpoint + ':predict');

    Map<String, String> headers = {"Accept": "application/json"};
    Map body =
    {
      "instances": [{
        "content": img64
      }],
    };
    String bodyJson = json.encode(body);

    var response = await httpClient?.post(url2, headers: headers, body: bodyJson);

    print('\n\n\n\n RESPONSE!!!!!!!!\n\n\n');
    print(response?.body);
    print('\nDONE!!!!!\n\n\n\n');

    // print('\n\n\n\n\nPREDICT:');
    // print(predict);
    // print('\nEND PREDICT\n\n\n\n\n');

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

    // final request =
    // {
    //   "instances": [{
    //     "content": img64
    //   }],
    // };
    // final api = CloudMachineLearningEngineApi(httpClient!);
    // FIXME: should it be .fromJson?
    // final predictRequest = GoogleCloudMlV1PredictRequest.fromJson(request);
    // var endpoints = 'us-central1-aiplatform.googleapis.com';
    // var predict = api.projects.locations.endpoints.predict();


    String endpoint = '3866595366795214848';
    Uri url2 = Uri.parse('https://us-central1-aiplatform.googleapis.com/v1/projects/skin-safety-scanner/locations/us-central1/endpoints/' + endpoint + ':predict');

    Map<String, String> headers = {"Accept": "application/json"};
    Map body =
    {
      "instances": [{
        "content": img64
      }],
    };
    String bodyJson = json.encode(body);

    var response = await httpClient?.post(url2, headers: headers, body: bodyJson);

    print('\n\n\n\n RESPONSE!!!!!!!!\n\n\n');
    print(response?.body.toString());
    print('\nDONE!!!!!\n\n\n\n');

    // print('\n\n\n\n\nPREDICT:');
    // print(predict);
    // print('\nEND PREDICT\n\n\n\n\n');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }
}