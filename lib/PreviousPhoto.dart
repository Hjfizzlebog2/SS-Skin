import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'Constants.dart';

// class for the log history screen
class PreviousPhoto extends StatefulWidget {
  const PreviousPhoto({Key? key}) : super(key: key);

  @override
  _PreviousPhotoState createState() => _PreviousPhotoState();
}

class _PreviousPhotoState extends State<PreviousPhoto> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  static const backgroundColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: textColor,
          ),
          title: const Text('Skin Safety Scanner',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor,
              )
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
          // automaticallyImplyLeading: false, //Maybe delete me
          actions: <Widget> [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisteredHomePage())
                      );
                    },
                    child: const Icon(
                      Icons.home,
                      color: textColor,
                    )
                )
            )
          ]
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getImages(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {

                    return ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data?.docs[index]["Condition"] + "\n"
                          + snapshot.data?.docs[index]["Date"] + "\n" +
                          (double.parse(snapshot.data?.docs[index]["Probability"]))
                              .toStringAsFixed(2) + "%", //Made it so that it shows to 2 decimal points
                      style: const TextStyle(
                        color: textColor,
                      ),
                      ),
                      leading: Material(

                        elevation: Constants.buttonElevation,
                        child: Image.network(
                          snapshot.data?.docs[index]["url"], fit: BoxFit.fill),)
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("No data");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("results").doc(RegisteredHomePage.user.user?.uid)
        .collection('case').orderBy('DateTime', descending: true).get();
  }
}