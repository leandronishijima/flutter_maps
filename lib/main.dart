import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: const Text(
        'Rastreamento: MGH-8543',
      )),
      body: MapsDemo(),
    ),
  ));
}

class MapsDemo extends StatefulWidget {
  @override
  State createState() => MapsDemoState();
}

class MapsDemoState extends State<MapsDemo> {
  GoogleMapController mapController;

  LatLng maringa = LatLng(-23.425505, -51.939044);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          options: GoogleMapOptions(
            cameraPosition: CameraPosition(
              zoom: 15.0,
              target: maringa,
            ),
            mapType: MapType.normal,
          ),
        )
      ]),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });

    controller.addMarker(MarkerOptions(
        position: maringa,
        infoWindowText: InfoWindowText('Marker 1', '*'),
        icon: BitmapDescriptor.defaultMarker));
  }
}
