import 'package:civitas/services/comingsoon.dart';
import 'package:civitas/services/complaints.dart';
import 'package:civitas/services/garbageman.dart';
import 'package:civitas/services/gossips.dart';
import 'package:civitas/services/news.dart';
import 'package:civitas/services/vehiclemng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class service extends StatefulWidget {
  final int number;
  final String serviceName;
  final IconData iconData;

  const service(
      {Key? key,
      required this.number,
      required this.serviceName,
      required this.iconData,
})
      : super(key: key);

  @override
  _serviceState createState() => _serviceState(
      number: this.number,
      serviceName: this.serviceName,
      iconData: this.iconData,
);
}

class _serviceState extends State<service> {
  int number;
  String serviceName;
  IconData iconData;

  _serviceState(
      {required this.number,
      required this.serviceName,
      required this.iconData,
});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
goToPage(serviceName, context);
      },
      child: Container(
        width: 25,
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${number + 1}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
            borderRadius: BorderRadius.circular(25), color: Colors.green),
      ),
    );
  }
}


void goToPage(String pageName, BuildContext context){
  switch(pageName){
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
        MaterialPageRoute(builder: (context) => const gossips()),
      );
      break;
    case 'Complaints':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const complaints()),
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