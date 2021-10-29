import 'dart:async';
import 'dart:collection';

import 'package:civitas/profile/popupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class garbageman extends StatefulWidget {
  const garbageman({Key? key}) : super(key: key);

  get currentUser => null;

  @override
  _garbagemanState createState() => _garbagemanState();
}

class _garbagemanState extends State<garbageman> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;
  List<Marker> myMarker = [];

  late LatLng tappedPoint;
  @override
  void initState() {
    markerLoc();
    super.initState();
    _setCircles();
  }
  markerLoc(){
    Marker loc1=Marker(
      markerId: MarkerId('')


    );
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/ping_icon.png');
  }
  void _setCircles(){
    _circles.add(
        Circle(
          circleId: CircleId("0"),
          center: LatLng(13.093206,80.276804),
          radius: 1000,
          fillColor: Color.fromRGBO(144, 238, 144, 0.25),
          strokeWidth: 2
    )
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(13.082680, 80.270721),
          infoWindow: InfoWindow(title: "Chennai", snippet: "City"),
          icon: _markerIcon));
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
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(13.093206,80.276804),
                zoom: 12,
              ),
              markers: Set.from(myMarker),
              onTap: handleTap,
              circles: _circles,
              //mapType: MapType.hybrid,
              //markers: _markers,
            ),
            /*Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 0, 60, 30),
              child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    handleTap(tappedPoint);
                  },
                  child: const Icon(Icons.add_circle_outline_rounded)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(60, 0, 0, 30),
              child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () async {
                    String selected = await showModalBottomSheet(
                      context: context,
                      builder: (context) => PopUpScreen(),
                    );
                    print(selected);
                    if (selected == 'null') {
                      print('No change');
                    } else {
                      var sel = ImageSource.gallery;
                      sel = selected == 'Gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera;
                      final ImagePicker _picker = ImagePicker();
                      final XFile? image = await _picker.pickImage(source: sel);
                    }
                  },
                  child: const Icon(Icons.camera_alt_rounded)),
            ),*/
          ],
        ));
  }

  handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }
}
