import 'dart:collection';

import 'package:civitas/profile/customwidgets.dart';
import 'package:civitas/profile/popupscreen.dart';
import 'package:civitas/services/vehiclemanwidget.dart';
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
  Set<Circle> _circles = HashSet<Circle>();
  double pinPillPosition = -100;

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

  void initState() {
    parkingLoc();
    super.initState();
    _setCircles();
  }

  parkingLoc() {
    Marker loc1 = Marker(
      markerId: MarkerId('Parking1'),
      position: LatLng(13.094331, 80.277021),
      infoWindow: InfoWindow(title: 'Parking1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => vehiclemanwidget(),
        );
      },
    );
    Marker loc2 = Marker(
      markerId: MarkerId('Parking2'),
      position: LatLng(13.092439, 80.277580),
      infoWindow: InfoWindow(title: 'Parking2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => vehiclemanwidget(),
        );
      },
    );
    Marker loc3 = Marker(
      markerId: MarkerId('Parking3'),
      position: LatLng(13.096285, 80.279007),
      infoWindow: InfoWindow(title: 'Parking3'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => vehiclemanwidget(),
        );
      },
    );
    Marker loc4 = Marker(
      markerId: MarkerId('Parking4'),
      position: LatLng(13.090255, 80.277750),
      infoWindow: InfoWindow(title: 'Parking4'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => vehiclemanwidget(),
        );
      },
    );
    Marker loc5 = Marker(
      markerId: MarkerId('Parking5'),
      position: LatLng(13.094728, 80.275453),
      infoWindow: InfoWindow(title: 'Parking5'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      onTap: () async {
        String selected = await showModalBottomSheet(
          context: context,
          builder: (context) => vehiclemanwidget(),
        );
      },
    );
    myMarker.add(loc1);
    myMarker.add(loc2);
    myMarker.add(loc3);
    myMarker.add(loc4);
    myMarker.add(loc5);
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
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(Utils.mapStyles);
                _mapController = controller;
              },
              //onTap: handleTap,
              circles: _circles,
              //mapType: MapType.hybrid,
              //markers: _markers,
            ),
            AnimatedPositioned(
              bottom: pinPillPosition,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset.zero,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: roundedButton(
                        buttonColor: Colors.indigo,
                        buttonText: 'Report Bin Full',
                        returnValue: 'Report Bin Full',
                      ))
                    ],
                  ),
                ),
              ),
            )
            /*Container(
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
            ),*/
          ],
        ));
  }

  /*handleTap() {
    setState(() {

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
