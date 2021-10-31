import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  roundedButton(
      {required this.buttonColor,
      required this.buttonText,
      required this.returnValue});
  final Color buttonColor;
  final String buttonText;
  final String returnValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            final snackBar = SnackBar(content: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Action has been accomplished'),
              ],

            ),
              elevation: 15,
              backgroundColor: Colors.cyan,
              duration: Duration(seconds: 3),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              behavior: SnackBarBehavior.floating,);

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context, returnValue);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.buttonColor,
      required this.buttonText,
      required this.onPressed,
      required this.icon,
      required this.currentUser});
  final Color buttonColor;
  final String buttonText;
  Widget onPressed;
  final IconData icon;
  final userinfo currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => onPressed));
            // onPressed;
          },
          minWidth: 200.0,
          height: 42.0,
          child: ListTile(
            title: Text(buttonText,
                style: TextStyle(color: Colors.white, fontSize: 20)),
            leading: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('onPressed', onPressed));
  }
}
