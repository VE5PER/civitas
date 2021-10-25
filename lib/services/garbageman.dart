import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }
}
