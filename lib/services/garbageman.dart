import 'dart:async';
import 'dart:collection';

import 'package:civitas/profile/customwidgets.dart';
import 'package:civitas/profile/popupscreen.dart';
import 'package:civitas/services/garbagemanwidget.dart';
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
  double pinPillPosition = -100;
  double PIN_INVISIBLE_POSITION = -220;

  late LatLng tappedPoint;
  @override
  void initState() {
    markerLoc();
    super.initState();
    _setCircles();
  }

  markerLoc() {
    Marker loc1 = Marker(
      markerId: MarkerId('Bin1'),
      position: LatLng(13.093342, 80.276159),
      infoWindow: InfoWindow(title: 'Bin1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
    );
    Marker loc2 = Marker(
      markerId: MarkerId('Bin2'),
      position: LatLng(13.093211, 80.277512),
      infoWindow: InfoWindow(title: 'Bin2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
      //onTap: tapRequest
    );
    Marker loc3 = Marker(
      markerId: MarkerId('Bin3'),
      position: LatLng(13.093697, 80.276573),
      infoWindow: InfoWindow(title: 'Bin3'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
      //onTap: tapRequest
    );
    Marker loc4 = Marker(
      markerId: MarkerId('Bin4'),
      position: LatLng(13.092589, 80.275333),
      infoWindow: InfoWindow(title: 'Bin4'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
      //onTap: tapRequest
    );
    Marker loc5 = Marker(
      markerId: MarkerId('Bin5'),
      position: LatLng(13.094105, 80.276395),
      infoWindow: InfoWindow(title: 'Bin5'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
      //onTap: tapRequest
    );
    Marker loc6 = Marker(
      markerId: MarkerId('Bin6'),
      position: LatLng(13.093613, 80.277850),
      infoWindow: InfoWindow(title: 'Bin6'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => garbagewidget(),
        );
      },
      //onTap: tapRequest()
    );
    myMarker.add(loc1);
    myMarker.add(loc2);
    myMarker.add(loc3);
    myMarker.add(loc4);
    myMarker.add(loc5);
    myMarker.add(loc6);
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/ping_icon.png');
  }

  void _setCircles() {
    _circles.add(Circle(
        circleId: CircleId("0"),
        center: LatLng(13.093206, 80.276804),
        radius: 500,
        fillColor: Color.fromRGBO(144, 238, 144, 0.25),
        strokeWidth: 2));
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyles);
    setState(() {
      _mapController = controller;
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
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(13.093206, 80.276804),
                  zoom: 12,
                ),
                markers: Set.from(myMarker),
                /*onTap: (LatLng loc){
                  this.pinPillPosition=PIN_INVISIBLE_POSITION;
                },*/
                circles: _circles,
                //mapType: MapType.hybrid,
                //markers: _markers,
              ),
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

  /*handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }*/

}

class Utils {
  static String mapStyles = ''' 
  [
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]
  ''';
}
