import 'package:flutter/cupertino.dart';

class drawerItems extends StatefulWidget {
  const drawerItems({Key? key}) : super(key: key);

  @override
  _drawerItemsState createState() => _drawerItemsState();
}

class _drawerItemsState extends State<drawerItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Text("Side Bar Stuffs"),
          ],
        )
    );
  }
}
