import 'package:flutter/cupertino.dart';

class draweritems extends StatefulWidget {
  const draweritems({Key? key}) : super(key: key);

  @override
  _draweritemsState createState() => _draweritemsState();
}

class _draweritemsState extends State<draweritems> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text("Side Bar Stuffs"),
      ],
    ));
  }
}
