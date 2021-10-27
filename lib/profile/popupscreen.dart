import 'package:flutter/material.dart';
import 'customwidgets.dart';

class PopUpScreen extends StatelessWidget {
  late String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Container(
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
              buttonText: 'Camera',
              returnValue: 'Camera',
            ),
            roundedButton(
              buttonColor: Colors.blue,
              buttonText: 'Gallery',
              returnValue: 'Gallery',
            ),
            roundedButton(
              buttonColor: Colors.red,
              buttonText: 'Cancel',
              returnValue: 'null',
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
