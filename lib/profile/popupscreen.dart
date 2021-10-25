import 'package:flutter/material.dart';

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
            CustomButton(title: 'Camera', returnValue: 'Camera'),
            CustomButton(title: 'Gallery', returnValue: 'Gallery'),
            CustomButton(title: 'Cancel', returnValue: 'null'),
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

class CustomButton extends StatelessWidget {
  String title;
  String returnValue;
  CustomButton({required this.title, required this.returnValue});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context, returnValue);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
