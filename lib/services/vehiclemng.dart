import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class vehiclemng extends StatefulWidget {
  const vehiclemng({Key? key}) : super(key: key);

  @override
  _vehiclemngState createState() => _vehiclemngState();
}

class _vehiclemngState extends State<vehiclemng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VEHICLE MNG"),
      ),
    );
  }
}
