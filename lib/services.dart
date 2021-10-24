import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class service extends StatefulWidget {
  final int number;
  const service({Key? key, required this.number}) : super(key: key);

  @override
  _serviceState createState() => _serviceState(number: this.number);
}

class _serviceState extends State<service> {
  int number;
  _serviceState({required this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$number",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.red),
    );
  }
}
