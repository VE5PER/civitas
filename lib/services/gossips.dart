import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gossips extends StatefulWidget {
  const gossips({Key? key}) : super(key: key);

  @override
  _gossipsState createState() => _gossipsState();
}

class _gossipsState extends State<gossips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GOSSIPS"),
      ),
    );
  }
}
