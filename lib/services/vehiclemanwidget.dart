import 'package:civitas/profile/customwidgets.dart';
import 'package:flutter/material.dart';
import 'customised.dart';

class vehiclemanwidget extends StatelessWidget {
  late String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 180,
      padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Select',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          roundedButton(
            buttonColor: Colors.blue,
            buttonText: 'Mark Spot',
            returnValue: 'Mark Spot',
          ),
        ],
      ),
    );
  }
}