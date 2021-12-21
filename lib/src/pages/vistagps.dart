import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/domain/controller/googlemaps_controller.dart';

class vistagps extends StatefulWidget {
  const vistagps({Key? key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<vistagps> {
  MapController googleMapController = Get.find();

  final Set<Marker> _markers = Set();

  late GoogleMapController mapController;

  MapType _defaultMapType = MapType.normal;

  /*@override
  void initState() {
    super.initState();
  }*/

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    await googleMapController.getCurrentMapLocation();
    mapController = controller;
    mapController.animateCamera(
        CameraUpdate.newLatLngZoom(googleMapController.posIni, 10.0));
  }

  void updateMap() async {
    await googleMapController.getCurrentMapLocation();
    mapController.animateCamera(
        CameraUpdate.newLatLngZoom(googleMapController.posIni, 10.0));
    setState(() {
      _markers.add(
        Marker(
            markerId: const MarkerId('Here'),
            position: googleMapController.posIni,
            infoWindow:
                const InfoWindow(title: 'Position', snippet: 'Here I am')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: googleMapController.getCurrentMapLocation(),
      builder: (context, snatpshot) {
        if (googleMapController.getCurrentMapLocation()!=null) {
          return Container(
            // appBar: AppBar(
            //   title: const Text('VistaGPS Animester',
            //       style: TextStyle(color: Colors.orange)),
            //   backgroundColor: Colors.grey[800],
            // ),
            child: Obx(
              () => Stack(children: <Widget>[
                GoogleMap(
                  mapType: _defaultMapType,
                  myLocationEnabled: true,
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                      target: googleMapController.posIni, zoom: 10.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80, right: 10),
                  alignment: Alignment.topRight,
                  child: Column(children: <Widget>[
                    FloatingActionButton(
                        child: const Icon(Icons.layers),
                        elevation: 5,
                        backgroundColor: Colors.teal[200],
                        onPressed: () {
                          _changeMapType();
                          print('Changing the Map Type');
                        }),
                    FloatingActionButton(
                        child: const Icon(Icons.gps_not_fixed_outlined),
                        elevation: 5,
                        backgroundColor: Colors.teal[100],
                        onPressed: () => updateMap()),
                  ]),
                ),
              ]),
            ),
          );
        }
        return Text('Loading...');
      },
    ));
  }
}
