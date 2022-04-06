import 'dart:convert';

import 'package:ss_skin_project/GeocodeData.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/NearbyDermatologists.dart';
import 'package:http/http.dart' as http;

//Example Geocoding get request (For CBU's postal code of 92504)
// https://maps.googleapis.com/maps/api/geocode/json?address=92504&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y

class ZipCodeCollection extends StatefulWidget {
  const ZipCodeCollection({Key? key}) : super(key: key);

  @override
  _ZipCodeCollectionState createState() => _ZipCodeCollectionState();
}

class _ZipCodeCollectionState extends State<ZipCodeCollection> {

  TextEditingController _zipcodeTEC = TextEditingController();

/*
  Future<SearchResults> fetchSearchResults(String zip) async {
    String createdURL = "https://maps.googleapis.com/maps/api/geocode/json?address=" + zip + "&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y";
    final response = await http.get(Uri.parse(
        createdURL));

    if (response.statusCode == 200) {
      //Change Data into List of Result
      return SearchResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to complete get request');
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Safety Scanner"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              'Find Nearby Dermatologists\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            )
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Enter your zip code',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22
                  )
              )
          ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _zipcodeTEC,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ZIP Code',
            ),
          )
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: ElevatedButton.icon(
              onPressed: () async {
                //STEP 1: Get data from text field [DONE]
                String zip = _zipcodeTEC.text;

                //STEP 2: Fetch data with get request [DONE]
                String createdURL = "https://maps.googleapis.com/maps/api/geocode/json?address=" + zip + "&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y";
                final response = await http.get(Uri.parse(createdURL));

                //STEP 3: Parse JSON to get lat and long (Update lat and long) [DONE]
                GeocodeData geocodeData = GeocodeData.fromJson(jsonDecode(response.body));
                //TODO: Add check for if null (replace the !)
                double lat = geocodeData.results![0].geometry?.location?.lat as double;
                double long = geocodeData.results![0].geometry?.location?.lng as double;

                //STEP 4: Pass lat and long to NearbyDermatologists [DONE]
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearbyDermatologists(lat: lat, long: long)),
                );
              },
              label: const Text(
                  'See Who\'s Nearby',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              icon: const Icon(Icons.navigate_next),
            )
          )
        ]
      )
    );
  }
}

/*
//Connection to TestScreen button

Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestScreen(value: value)),
                );
              },
              label: const Text(
                  'Pass a Value',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              icon: const Icon(Icons.navigate_next),
            )
          )

 */