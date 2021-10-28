import 'package:flutter/cupertino.dart';

class pg3 extends StatefulWidget {
  const pg3({Key? key}) : super(key: key);

  @override
  _pg3State createState() => _pg3State();
}

class _pg3State extends State<pg3> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xfff6d365
                    ), Color(0xfffda085)])),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Center(
            child: Image.asset(
          'assets/images/Civitas(2).png',
          fit: BoxFit.cover,
        )));
  }
}
