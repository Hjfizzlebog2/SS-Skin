import 'package:flutter/material.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';


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
          backgroundColor: Colors.cyan[600],
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                '\nPast Results',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(15),
                height: 500,
                child: ListView (
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("results").doc(RegisteredHomePage.user.user?.uid)
                            .collection('case').snapshots(),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const Text("No Data");
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
              title: Text("\nDate: " + doc["Date"] + "\n\n"
                  + "Condition: " + doc["Condition"] + "\n\n" +
                  "Probability: " + doc["Probability"] + "%\n")
          );
        }
    );
  }
}