import 'package:flutter/material.dart';
import 'package:places_service/places_service.dart';
import 'package:google_place/google_place.dart';

class NearbyDermatologists extends StatefulWidget {
  const NearbyDermatologists({Key? key}) : super(key: key);

  @override
  _NearbyDermatologistsState createState() => _NearbyDermatologistsState();

  //Complete: Start with Basic screen UI (try things out. you won't know it doesn't work until you try)
  //TODO: > Get the map to work
  //TODO: Get a location to show up on screen
  //TODO: Get multiple locations to show up on screen
  //TODO: Get a nearby location to show up on screen
}

class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  // The below stuff isn't working yet. There's something wrong with trying to get await to work. I need to learn more about asynchronous code
  // var googlePlace = GooglePlace('AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y');
  // //var result = await googlePlace.autocomplete;
  // var result = await googlePlace.search.getNearBySearch(
  //   Location(lat: -33.8670522, lng: 151.1957362), 1500,
  //     type: 'restaurant', keyword: 'cruise');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Safety Scanner'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: const Text(
              'Nearby Dermatologists',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34
              )
            ),
          )
        ]
      )
    );
  }
}