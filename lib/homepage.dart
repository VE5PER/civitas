
import 'package:civitas/services.dart';
import 'package:civitas/sideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String>servicesList=['Trash Man', 'Vehicle Mng', 'Gossips', 'Complaints', 'News', 'Coming Soon'];
List<IconData>iconList=[Icons.garage,Icons.car_rental,Icons.chat,Icons.comment, Icons.chrome_reader_mode, Icons.construction];

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
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < 6; i++) service(number: i, serviceName: servicesList[i], iconData: iconList[i],),
          ],
        ),
      ),
      drawer: const drawerItems(),
    );
  }
}
