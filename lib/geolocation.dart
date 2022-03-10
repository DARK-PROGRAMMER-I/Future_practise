// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:future_app/geolocation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;
  // Here we will Initiallize the Future Function to get the value
  @override
  void initState(){
    _getCurrentLocation();
    super.initState();
  }
  // void initState(){
  //
  //   getPosition().then((Position position){
  //     currentPos = "latitude"+ position.latitude.toString() + "Longitude" + position.longitude.toString();
  //
  //   });
  //   setState(() {
  //     currentPos = currentPos;
  //   });
  //   print(currentPos);
  //   super.initState();
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location Finder'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if (_currentPosition != null) Text(
      "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"
      ),
      TextButton(
        child: Text("Get location"),
        onPressed: () {
          _getCurrentLocation();
                      },
      )]
        ),
      ),
    );
  }

  // Building a function to get the current location
  // Future<Position> getPosition()async{
  //   Position? position = await Geolocator.getLastKnownPosition();
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     throw Exception('Error');
  //   }
  //   return await Geolocator.getCurrentPosition();
  //   return position!;
  // }
  _getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
  }

  // void locatePosition() async {
  //   bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  //
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();
  //
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //
  //   var currentPosition = position;
  //   LatLng latLngPosition = LatLng(position.latitude, position.longitude);
  //
  //   // Ask permission from device
  //   Future<void> requestPermission() async {
  //     await Permission.location.request();
  //   }


}
