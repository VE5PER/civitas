import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class garbageman extends StatefulWidget {
  const garbageman({Key? key}) : super(key: key);

  @override
  _garbagemanState createState() => _garbagemanState();
}

class _garbagemanState extends State<garbageman> {
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
            initialCameraPosition: CameraPosition(
              target: LatLng(13.082680,80.270721),
              zoom: 12,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Text("Just a Prototype!!"),
          )
        ],
      )
    );
  }
}
