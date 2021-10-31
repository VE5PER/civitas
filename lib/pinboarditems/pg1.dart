import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pg1 extends StatefulWidget {
  const pg1({Key? key}) : super(key: key);

  @override
  _pg1State createState() => _pg1State();
}

class _pg1State extends State<pg1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xfff83600), Color(0xfff9d423)])),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: const Center(
          child: Text(
            'WELCOME TO CIVITAS',
            style: TextStyle(
                fontSize: 30, fontFamily: 'Henny Penny', letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
