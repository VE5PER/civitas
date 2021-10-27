import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class empty extends StatefulWidget {
  const empty({Key? key}) : super(key: key);

  @override
  _emptyState createState() => _emptyState();
}

class _emptyState extends State<empty> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.orangeAccent),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: Center(
          child: Text(
            'Empty Board',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ));
  }
}
