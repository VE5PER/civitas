import 'package:civitas/services/chatbot/chatbot.dart';
import 'package:civitas/profile/profilecontent.dart';
import 'package:civitas/services/comingsoon.dart';
import 'package:civitas/services/complaints.dart';
import 'package:civitas/services/garbageman.dart';
import 'package:civitas/chatpage/gossips.dart';
import 'package:civitas/services/news.dart';
import 'package:civitas/services/vehiclemng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class service extends StatefulWidget {
  final int number;
  final String serviceName;
  final IconData iconData;
  userinfo currentUser;

  service({
    Key? key,
    required this.number,
    required this.serviceName,
    required this.iconData,
    required this.currentUser
  }) : super(key: key);

  @override
  _serviceState createState() => _serviceState(
        number: this.number,
        serviceName: this.serviceName,
        iconData: this.iconData, currentUser: currentUser,
      );
}

class _serviceState extends State<service> {
  int number;
  String serviceName;
  IconData iconData;
  userinfo currentUser;

  _serviceState({
    required this.number,
    required this.serviceName,
    required this.iconData,
    required this.currentUser,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToPage(serviceName, currentUser,context,);
      },
      child: Container(
        width: 25,
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              size: 50,
            ),
            Text(
              serviceName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xfff9f047), Color(0xff0fd850)])),
      ),
    );
  }
}

void goToPage(String pageName, userinfo currentUser,BuildContext context) {
  switch (pageName) {
    case 'Trash Man':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const garbageman()),
      );
      break;
    case 'Vehicle Mng':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const vehiclemng()),
      );
      break;
    case 'Gossips':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => gossips(currentUser)),
      );
      break;
    case 'Complaints':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bot()),
      );
      break;
    case 'News':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const news()),
      );
      break;
    case 'Coming Soon':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const comingsoon()),
      );
      break;
  }
}
