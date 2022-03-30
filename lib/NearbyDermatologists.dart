import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// API KEY: AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// In Safari, the below returns locations we need FIXME: <- That may not be true out of Safari
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// ^The second URL uses the location of CBU as an argument

// CBU Lat/Long: 33.9289° N, 117.4259° W


// Full Json Response from Places
class SearchResults {
  final List results; //WHAT IS THIS A LIST OF

  const SearchResults({required this.results});

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      results: json['results'], //This handles the complex JSON part
    );
  }
}

Future<SearchResults> fetchSearchResults() async {
  //NOTE: Need to do extra when statusCode is 200. Need to process data
  final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y'));

  if (response.statusCode == 200) {
    //Change Data into List of Result
    return SearchResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to complete get request');
  }
}

class NearbyDermatologists extends StatefulWidget {
  const NearbyDermatologists({Key? key}) : super(key: key);

  @override
  _NearbyDermatologistsState createState() => _NearbyDermatologistsState();
}

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
                                  snapshot.data!.results[index]['name'] + '\n\n'
                                      + snapshot.data!.results[index]['formatted_address'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25
                                  )
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

/*
//Basic Doctor's Office Skeleton
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
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Text(
                list[index],
              ));
            }));
  }
}

 */

/*
//Blue not working

Map? json;
  List? results;
  String url = 'https://jsonplaceholder.typicode.com/posts'; // CHANGE ME

  // Used to get the JSON data
  Future<String> getData() async {
    final encoded = Uri.encodeFull(url);
    var response = await http.get(
        Uri.parse(encoded)
    );

    setState(() {
      json = jsonDecode(response.body);
      results = json!['results']; // can't cast something null to List
    });
    print(results?[1]["title"]);

    return "Success!";
  }

 */

/*
//HARCODE 1 2 3 List
class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y';

  List<String> list = ['one', 'two', 'three', 'four', 'five'];

  // Builds user interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            title: Text(list[index])
          );
        }
      )
    );
  }


 */

/*
//THE BLUE SCREEN of listviews
class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  List? data;
  String url = 'https://jsonplaceholder.typicode.com/posts';

  // Used to get the JSON data
  Future<String> getData() async {
    final encoded = Uri.encodeFull(url);
    var response = await http.get(
        Uri.parse(encoded)
    );

    setState(() {
      data = jsonDecode(response.body); // can't cast something null to List
    });
    print(data?[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Builds user interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
            itemCount: data == null ? 0 : data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(
                    children: [
                      Text("Dog"),
                      Text(data?[index]["title"]), // ["title"] because that's one of the inner elements
                      Text(data?[index]['body'])
                    ],
                  )
              );
            }
        )
    );
  }


}

 */

/*
class NearbyDermatologists extends StatefulWidget {
  const NearbyDermatologists({Key? key}) : super(key: key);

  @override
  _NearbyDermatologistsState createState() => _NearbyDermatologistsState();
}



// DELETE BELOW HERE
Future<DermList> fetchDerms() async {
  final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y'));

  //If we get the data, deserialize it
  //Potential FIXME: Might need to  fix the below to parse the json
  if (response.statusCode == 200) {
    //OK in places
    return DermList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load the post.');
  }
}

class DermList {
  final List<Dermatologist> dermatologists;

  //Constructor
  DermList({required this.dermatologists});

  factory DermList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Dermatologist> resultsList =
        list.map((i) => Dermatologist.fromJson(i)).toList();

    return DermList(
      dermatologists: resultsList, //instantiated above
    );
  }
}

class Dermatologist {
  //Fields
  final String name;
  final String formattedAddress;

  //Constructor
  Dermatologist({
    required this.name,
    required this.formattedAddress,
  });

  //Instantiating a Post from parsing JSON (I think this is a method now)
  factory Dermatologist.fromJson(Map<String, dynamic> json) {
    return Dermatologist(
      name: json['name'], // how to access data from JSON
      formattedAddress: json['formatted_address'],
    );
  }
}


//DELETE ABOVE HERE

class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  late Future<DermList> futureDermList;

  @override
  void initState() {
    super.initState();
    futureDermList = fetchDerms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: FutureBuilder<DermList>(
            future: futureDermList,
            builder: (context, snapshot) {
              //error checking
              if (snapshot.hasData) {
                //display it
                List<DermList> dermatologists = <DermList>[]; // changed here
                for (int i = 0; i < dermatologists.length; i++) {
                  dermatologists.add(
                    DermList(
                      dermatologists: [
                        Dermatologist(
                          //FIXME: Below !!! should be removed if having troubles. Follow other tutorial.
                          name: snapshot.data!.dermatologists[i].name,
                          formattedAddress:
                              snapshot.data!.dermatologists[i].formattedAddress,
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  children: dermatologists
                      .map((dermatologist) => dermatologistTemplate(
                          dermatologist.dermatologists[0]))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                //while loading
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      );
  }

  //TODO: DELETE/MODIFY BELOW WIDGET
  Widget dermatologistTemplate(dermatologist) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        elevation: 4.0,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //text{post.id.toString()),
                  Text(
                    dermatologist.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dermatologist.formattedAddress,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ])));
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: const Text('Skin Safety Scanner'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.topCenter,
//               padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//               child: const Text(
//                   'Nearby Dermatologists',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 34
//                   )
//               ),
//             )
//           ]
//       )
//   );

// FOR JUST ONE JSON CARD IN THE LIST
// child: FutureBuilder<Post>(
// future: futurePost,
// builder: (context, snapshot) {
// //error checking
// if (snapshot.hasData) {
// //display it
// return Column(
// children: <Widget>[
// Text(snapshot.data.id.toString()),
// Text(snapshot.data.title),
// Text(snapshot.data.content),
// Text(snapshot.data.author),
// ],
// );
// } else if (snapshot.hasError) {
// return Text('${snapshot.error}');
// } else {
// //while loading
// return const CircularProgressIndicator();
// }
// },
// ),

}
*/