import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Constants.dart';
import 'RegisteredHomePage.dart';

// API KEY: AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// ^ Works for both Places and Geocoding

// In Safari, the below returns locations we need
// Places
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// ^The second URL uses the location of CBU as an argument
// CBU Lat/Long: 33.9289° N, 117.4259° W


// Full Json Response from Places
class SearchResults {
  final List results;

  const SearchResults({required this.results});

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      results: json['results'], //This handles the complex JSON part
    );
  }
}

class NearbyDermatologists extends StatefulWidget {
  final double lat;
  final double long;


  static const backgroundColor = Constants.mint;
  static const buttonColor =  Constants.mintAccent;
  static const textColor = Colors.black87;

  const NearbyDermatologists({
    Key? key,
    required this.lat,
    required this.long
  }) : super(key: key);



  @override
  _NearbyDermatologistsState createState() => _NearbyDermatologistsState();
}

class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  late Future<SearchResults> futureSearchResults;

  //Fetches the data
  @override
  void initState() {
    super.initState();
    futureSearchResults = fetchSearchResults(widget.lat, widget.long);
  }


  Future<SearchResults> fetchSearchResults(double lat, double long) async {
    String latString = lat.toString();
    String longString = long.toString();

    String createdURL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=' + latString + '%2C' + longString + '&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y';
    // String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y';
    final response = await http.get(Uri.parse(
        createdURL));

    if (response.statusCode == 200) {
      //Change Data into List of Result
      return SearchResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to complete get request');
    }
  }

  // Builds user interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NearbyDermatologists.backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: NearbyDermatologists.textColor,
          ),
          title: const Text('Skin Safety Scanner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: NearbyDermatologists.textColor,
              )
          ),
          centerTitle: true,
          backgroundColor: NearbyDermatologists.buttonColor,
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: NearbyDermatologists.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ]
        ),
        body: Center(
            child: FutureBuilder<SearchResults>(
                future: futureSearchResults,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: NearbyDermatologists.buttonColor,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[ Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                        child: Text(
                                            snapshot.data!.results[index]['name'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: NearbyDermatologists.textColor,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 25
                                            )
                                        )
                                      ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                                            child: Text(
                                                snapshot.data!.results[index]['formatted_address'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: NearbyDermatologists.textColor,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                )
                                            )
                                        )
                                        ,
                                      ]
                                    )
                                  )
                              ),
                            )
                          );
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                }
                )
        )
    );
  }
}


/*
Weird spacing but works
// Builds user interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NearbyDermatologists.backgroundColor,
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ]
        ),
        body: Center(
            child: FutureBuilder<SearchResults>(
                future: futureSearchResults,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                  color: NearbyDermatologists.buttonColor,
                                  child: Text(
                                      snapshot.data!.results[index]['name'] + '\n\n'
                                          + snapshot.data!.results[index]['formatted_address'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 25
                                      )
                                  )
                              ),
                            )
                          );
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                }
                )
        )
    );
  }

 */

/*
 IT WORKS!!! Doctors show without hardcoding!
 class _NearbyDermatologistsState extends State<NearbyDermatologists> {
   late Future<SearchResults> futureSearchResults;

   //Fetches the data
   @override
   void initState() {
     super.initState();
     futureSearchResults = fetchSearchResults();
   }

   List list = [
     'PACIFIC DERMATOLOGY INSTITUTE',
     'Dr. Vincent Fowler',
     'Meyering D Steven MD'
   ];

   // Builds user interface
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Skin Safety Scanner'),
           centerTitle: true,
           backgroundColor: Colors.blueAccent,
         ),
         body: Center(
             child: FutureBuilder<SearchResults>(
                 future: futureSearchResults,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     //NEED TO BREAK UP LOOP. CRAP
                     return ListView.builder(
                       itemCount: snapshot.data!.results.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Card(
                             child: Text(
                               snapshot.data!.results[index]['name'],
                             ));
                       }
                     );
                   } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                   }

                   return const CircularProgressIndicator();
                 })));
   }
 }

  */

/*
 GOT A DOCTOR TO SHOW UP!!!!
 class _NearbyDermatologistsState extends State<NearbyDermatologists> {
   late Future<SearchResults> futureSearchResults;

   //Fetches the data
   @override
   void initState() {
     super.initState();
     futureSearchResults = fetchSearchResults();
   }

   List list = [
     'PACIFIC DERMATOLOGY INSTITUTE',
     'Dr. Vincent Fowler',
     'Meyering D Steven MD'
   ];

   // Builds user interface
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Skin Safety Scanner'),
           centerTitle: true,
           backgroundColor: Colors.blueAccent,
         ),
         body: Center(
             child: FutureBuilder<SearchResults>(
                 future: futureSearchResults,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     //NEED TO BREAK UP LOOP. CRAP
                     return Text(snapshot.data!.results[19]['name']);
                   } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                   }

                   return const CircularProgressIndicator();
                 })));
   }
 }
  */