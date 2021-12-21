import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';

class Ubicacion extends StatefulWidget {
  const Ubicacion({
    Key? key,
  }) : super(key: key);

  @override
  _Ubicacion createState() => _Ubicacion();
}

class _Ubicacion extends State<Ubicacion> {
  String currentAddress = 'My Address';
  var currentposition;

  Future<Position> _findme() async {
    bool serviceEnabled;
    LocationPermission permission;
    var x;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    return (position);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text(currentAddress, style: TextStyle(color: Colors.orange)),
          currentposition != null
              ? Text('Latitude = ' + currentposition.latitude.toString(),
                  style: TextStyle(color: Colors.orange))
              : Container(),
          currentposition != null
              ? Text('Longitude = ' + currentposition.longitude.toString(),
                  style: TextStyle(color: Colors.orange))
              : Container(),
          currentposition != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'vistagps');
                    },
                    child: const Text('ver en mapa'),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                )
              : Container(),
          currentposition == null
              ? TextButton(
                  onPressed: () {
                    _findme();
                  },
                  child: Text('Localizame',
                      style: TextStyle(color: Colors.orange)),
                )
              : Container()
        ],
      ),
    ));
  }
}
