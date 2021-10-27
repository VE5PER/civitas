import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class garbageman extends StatefulWidget {
  const garbageman({Key? key}) : super(key: key);

  @override
  _garbagemanState createState() => _garbagemanState();
}

class _garbagemanState extends State<garbageman> {
  Set<Marker> _markers =HashSet<Marker>();
  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;
  List<Marker> myMarker=[];

  void _setMarkerIcon() async{
    _markerIcon=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/ping_icon.png');
  }
  void _onMapCreated(GoogleMapController controller){
    _mapController=controller;
    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId("0"),
              position: LatLng(13.082680,80.270721),
              infoWindow: InfoWindow(
                  title: "Chennai",
                  snippet: "City"
              ),
            icon: _markerIcon
          )
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRASH MAN"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(13.082680,80.270721),
              zoom: 12,
            ),
            markers: Set.from(myMarker),
            onTap: handleTap,
            //mapType: MapType.hybrid,
            //markers: _markers,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 60, 30),
            child: FloatingActionButton(
              backgroundColor: Colors.indigo,
              onPressed: (){},
              child: const Icon(Icons.location_on_rounded)
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(60, 0, 0, 30),
            child: FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: (){},
                child: const Icon(Icons.camera_alt_rounded)
            ),
          ),
        ],
      )
    );
  }
  handleTap(LatLng tappedPoint)
  {
    setState(() {
      myMarker=[];
      myMarker.add(
        Marker(
            markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        )
      );
    });
  }
}
