import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // String myPosition = '';
  // @override
  // void initState() {
  //   determinePosition().then((Position? myPos) {
  //     myPosition = 'Latitude: ' + myPos!.latitude.toString().substring(0, 4) + ' - Longitude: ' + myPos.longitude.toString().substring(0, 4);
  //     print(myPosition);
  //     setState(() {
  //       myPosition = myPosition;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Current Location')),
        body: Center(child: FutureBuilder(
          future: determinePosition(),
          builder: (BuildContext context, AsyncSnapshot<dynamic>
          snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            else if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError){
                return Text("Something Terrible has happened");
              }
              return Container(
                  child: Text(snapshot.data.toString()));
            }
            else {
              return Text('');
            }
          },
        ),
        ));
  }

  // Future<Position> getPosition() async {
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   return position;
  // }
  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}