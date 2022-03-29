import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// class for the past results screen
class PastResults extends StatefulWidget {
  const PastResults({Key? key}) : super(key: key);

  @override
  _PastResultsState createState() => _PastResultsState();
}

class _PastResultsState extends State<PastResults> {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Past Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("results").snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const LinearProgressIndicator();
                        } else {
                          return _buildList(snapshot.data as QuerySnapshot);
                        }
                      }
                  )
                ],
              )
            ),
            Container(
                padding: const EdgeInsets.all(5),
                width: 180,
                height: 70,
                child: TextButton(
                  child: const Text(
                      'View Photos',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreviousPhoto()),
                    );
                  },
                )
            ),
          ],
        )
    );
  }

  // function that returns a list view
  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return ListTile(
          title: Text("Date: " + doc["Date"] + "\n\n"
          + "Condition: " + doc["Condition"] + "\n\n" +
          "Probability: " + doc["Probability"] + "\n")
        );
      }
    );
  }

}