import 'package:flutter/material.dart';
import 'package:ss_skin_project/PreviousPhoto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';
import 'Constants.dart';


// class for the past results screen
class PastResults extends StatefulWidget {
  const PastResults({Key? key}) : super(key: key);

  @override
  _PastResultsState createState() => _PastResultsState();
}

class _PastResultsState extends State<PastResults> {
  final firestoreInstance = FirebaseFirestore.instance;

  static const backgroundColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
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
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(10,30,10,0),
              child: const Text(
                'Past Results',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34
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
                            return const Text(
                                "No Data",
                                style: TextStyle(color: textColor,)
                            );
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
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.navigate_next, color: textColor),
                  label: const Text(
                      'View Photos',
                      style: TextStyle(
                        color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: Constants.buttonElevation,
                      primary: buttonColor
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
                  "Probability: " + double.parse(doc["Probability"]).toStringAsFixed(2) + "%\n", // Made it so that probability shows to 2 decimal points
                style: const TextStyle(
                  color: textColor,
                ),
              ),
          );
        }
    );
  }
}