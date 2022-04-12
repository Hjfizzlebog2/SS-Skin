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
import 'package:http/http.dart' as http;

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
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
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
              ),
            ),
          ],
        )
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

    // TODO: Authentication?????
    // gcloud auth application-default login

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

    json.encode(request);

    String ENDPOINT_ID = "5815105893074731008";
    String PROJECT_ID = "skin-safety-scanner";

    var client = http.Client();

    // TODO: EXECUTE THIS COMMAND
    // curl \
    // -X POST \
    // -H "Authorization: Bearer $(gcloud auth print-access-token)" \
    // -H "Content-Type: application/json" \
    // https://us-central1-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/us-central1/endpoints/${ENDPOINT_ID}:predict \
    // -d "@${INPUT_DATA_FILE}"

    GoogleCloudMlV1PredictRequest.fromJson(request);


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
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

    // TODO: Authentication?????
    // gcloud auth application-default login

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

    json.encode(request);

    String ENDPOINT_ID = "5815105893074731008";
    String PROJECT_ID = "skin-safety-scanner";

    // TODO: EXECUTE THIS COMMAND
    // curl \
    // -X POST \
    // -H "Authorization: Bearer $(gcloud auth print-access-token)" \
    // -H "Content-Type: application/json" \
    // https://us-central1-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/us-central1/endpoints/${ENDPOINT_ID}:predict \
    // -d "@${INPUT_DATA_FILE}"

    GoogleCloudMlV1PredictRequest.fromJson(request);


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
  }
}