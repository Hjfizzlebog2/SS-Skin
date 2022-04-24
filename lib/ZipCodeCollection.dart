import 'dart:convert';
import 'package:ss_skin_project/GeocodeData.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/NearbyDermatologists.dart';
import 'package:http/http.dart' as http;

import 'Constants.dart';
import 'RegisteredHomePage.dart';

//Example Geocoding get request (For CBUs postal code of 92504)
// https://maps.googleapis.com/maps/api/geocode/json?address=92504&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y

class ZipCodeCollection extends StatefulWidget {
  const ZipCodeCollection({Key? key}) : super(key: key);

  @override
  _ZipCodeCollectionState createState() => _ZipCodeCollectionState();
}

class _ZipCodeCollectionState extends State<ZipCodeCollection> {

  static const backgroundColor = Constants.mint;
  static const buttonColor =  Constants.mintAccent;
  static const textColor = Colors.black87;

  final TextEditingController _zipcodeTEC = TextEditingController();

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
                  // fontWeight: FontWeight.bold,
                  color: textColor,
                )
            ),
            centerTitle: true,
            backgroundColor: buttonColor,
            // automaticallyImplyLeading: false, //Maybe delete me
            actions: <Widget> [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  child: const Text(
                      "What's your zip code?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: 34
                      )
                  )
              ),
              //MELANOMA
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                      "Enter a location below.",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 22
                      )
                  )
          ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _zipcodeTEC,
            maxLength: 5,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ZIP Code',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 5
                ? 'Enter 5 characters'
                : null,
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
                      // final response2 = await http.post(Uri.parse())

                      //STEP 3: Parse JSON to get lat and long (Update lat and long) [DONE]
                      GeocodeData geocodeData = GeocodeData.fromJson(jsonDecode(response.body));

                      double lat = geocodeData.results![0].geometry?.location?.lat as double;
                      double long = geocodeData.results![0].geometry?.location?.lng as double;

                      //STEP 4: Pass lat and long to NearbyDermatologists [DONE]
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NearbyDermatologists(lat: lat, long: long)),
                      );
                    },
                    label: const Text(
                        'Search',
                        style: TextStyle(
                          color: textColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18
                        )
                    ),
                    icon: const Icon(
                        Icons.navigate_next,
                        color: textColor
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: Constants.buttonElevation,
                        primary: buttonColor,
                    ),
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