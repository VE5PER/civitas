import 'dart:collection';

import 'package:civitas/profile/popupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class vehiclemng extends StatefulWidget {
  const vehiclemng({Key? key}) : super(key: key);

  @override
  _vehiclemngState createState() => _vehiclemngState();
}

class _vehiclemngState extends State<vehiclemng> {
  Set<Marker> _markers = HashSet<Marker>();
  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;
  List<Marker> myMarker = [];
  late LatLng tappedPoint;

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/ping_icon.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VEHICLE MNG"),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(13.082680, 80.270721),
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
                  onPressed: () {
                    handleTap(tappedPoint);
                  },
                  child: const Icon(Icons.location_on_rounded)),
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
                  child: const Icon(Icons.directions_car)),
            ),
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
