import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Questionnaire.dart';

// class for the photo submission screen
class PhotoSubmission extends StatelessWidget {
   late File imageFile;

  PhotoSubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Skin Safety Scanner"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Lets take a photo!",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
            Image.asset('images/photosubmission.jpg'),
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
                label: const Text("Use camera",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
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
                label: const Text("Choose from device",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
                ),
              ),
            ),
          ],
        )
    );
  }

   // get from gallery function
   _getFromGallery() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.gallery,
       maxWidth: 1800,
       maxHeight: 1800,
     );
     if (pickedFile != null) {
       setState(() {
         imageFile = File(pickedFile.path);
       });
     }
   }

   // get from camera function
   _getFromCamera() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.camera,
     );
     if (pickedFile != null) {
       setState(() {
         imageFile = File(pickedFile.path);
       });
     }
   }

  void setState(Null Function() param0) {
    imageFile = File(imageFile.path);
  }
  
}
