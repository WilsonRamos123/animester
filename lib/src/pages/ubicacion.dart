import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart'; 

class Ubicacion extends StatefulWidget {
  const Ubicacion({
    Key? key,
  }) : super(key: key);

  @override
  _Ubicacion createState() => _Ubicacion();
}

class _Ubicacion extends State<Ubicacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geolocalizacion')),
      body: Center(
        child: Column(
          children: [
            Text('Direccion'),
            Text('Latitud'),
            Text('longitud'),
            TextButton(onPressed:(){}, child: Text('Localizame'),
            )
          ],
        ),
      )
    );
    

  }
}
