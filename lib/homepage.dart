import 'package:civitas/pinboard.dart';
import 'package:civitas/services.dart';
import 'package:civitas/sideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:civitas/profile/profile.dart';

List<String> servicesList = [
  'Trash Man',
  'Vehicle Mng',
  'Gossips',
  'Complaints',
  'News',
  'Coming Soon'
];
List<IconData> iconList = [
  Icons.restore_from_trash,
  Icons.car_rental,
  Icons.chat,
  Icons.warning,
  Icons.chrome_reader_mode,
  Icons.construction
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CIVITAS"),
        centerTitle: true,
        actions: [
          popupProfileButton()
          // IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pinboard(),
            Expanded(
              child: Scrollbar(
                thickness: 3,
                radius: Radius.circular(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    for (int i = 0; i < 6; i++)
                      service(
                        number: i,
                        serviceName: servicesList[i],
                        iconData: iconList[i],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const drawerItems(),
    );
  }
}
