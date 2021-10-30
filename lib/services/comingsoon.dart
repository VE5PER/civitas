import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class comingsoon extends StatefulWidget {
  const comingsoon({Key? key}) : super(key: key);

  @override
  _comingsoonState createState() => _comingsoonState();
}

class _comingsoonState extends State<comingsoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMING SOON"),
      ),
      body: Center(
          child: Icon(
        Icons.report_gmailerrorred_outlined,
        size: 250,
      )),
    );
  }
}
