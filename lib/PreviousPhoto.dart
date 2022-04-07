import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/PastResults.dart';

// class for the log history screen
class PreviousPhoto extends StatefulWidget {
  const PreviousPhoto({Key? key}) : super(key: key);

  @override
  _PreviousPhotoState createState() => _PreviousPhotoState();
}

class _PreviousPhotoState extends State<PreviousPhoto> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Safety Scanner'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
                          snapshot.data?.docs[index]["Probability"] + "%"),
                      leading: Image.network(
                          snapshot.data?.docs[index]["url"],
                          fit: BoxFit.fill),
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
    return fb.collection("results").get();
  }
}