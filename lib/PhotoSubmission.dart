import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/ml/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ss_skin_project/GeneratedReport.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ss_skin_project/ReviewPhotoScreen.dart';

// FIXME: Google sign-in - make it automatic?
//final GoogleSignIn _googleSignIn = GoogleSignIn(
 // scopes: <String>[
   // 'https://www.googleapis.com/auth/cloud-platform',
   // 'https://www.googleapis.com/auth/cloud-vision',
 // ],
//);

// var httpClient = (await _googleSignIn.authenticatedClient())!;

// var request = CloudMachineLearningEngineApi;

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
          backgroundColor: Colors.redAccent,
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
                  // take photo with camera function
                },
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
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey)
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

    // FIXME: picking a file isn't working, pickedFile is still null after the ImagePicker()
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
    Image image = Image.asset('assets/images/melanoma.jpeg');
    final bytes = imageFile.readAsBytesSync();
    String img64 = base64Encode(bytes);
    print('\n\n\n\n\n\n\n\n' + img64.substring(0, 100) + '\n\n\n\n\n\n\n\n');

    // _setPlaceHolder() async {
    //   imageFile = ImageUtils.imageToFile(imageName: "melanoma", ext: "jpeg") as File;
    // }

    // Image.file(imageFile);
    // final bytes = imageFile.readAsBytesSync();
    // String img64 = base64Encode(bytes);
    // print('\n\n\n\n\n\n\n' + img64.substring(0, 100) + '\n\n\n\n\n\n\n');



    // final bytes = File('assets/images/log_history.jpg').readAsBytesSync();
    // String img64 = base64Encode(bytes);
    // print(img64.substring(0, 100));
    //
    // List<int> imageBytes = imageFile.readAsBytesSync();
    // String base64Image = base64Encode(imageBytes);

    final request = [
      {
        "instances": [{
          "content": img64
        }],
        "parameters": {
          "confidenceThreshold": 0.5,
          "maxPredictions": 5
        }
      }
    ];
    print(json.encode(request));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
    //
    // imageFile = Image.asset('melanoma.jpeg') as File;
    // List<int> imageBytes = await widget.imageFile.readAsBytes();
    // String base64Image = BASE64.encode(imageBytes);
    // GoogleCloudMlV1PredictRequest.fromJson(img64);
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
    // Image image = Image.asset('assets/images/melanoma.jpeg');
    // Io.File file = image as Io.File;
    // final bytes = file.readAsBytesSync();
    // String base64Encode(List<int> bytes) => base64.encode(bytes);

    // final bytes = Io.File('assets/images/log_history.jpg').readAsBytesSync();
    // String img64 = base64Encode(bytes);
    // print(img64.substring(0, 100));

    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    final request = [
      {
        "instances": [{
          "content": base64Image
        }],
        "parameters": {
          "confidenceThreshold": 0.5,
          "maxPredictions": 5
        }
      }
    ];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPhotoScreen(imageFile.path, imageFile)),
    );
    // GoogleCloudMlV1PredictRequest.fromJson(json.encode(request));
  }
}

class ImageUtils {
  static Future<File> imageToFile({required String imageName, required String ext}) async {
    var bytes = await rootBundle.load('assets/$imageName.$ext');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/profile.png');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }
}