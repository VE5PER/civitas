import 'package:flutter/cupertino.dart';

class pg2 extends StatefulWidget {
  const pg2({Key? key}) : super(key: key);

  @override
  _pg2State createState() => _pg2State();
}

class _pg2State extends State<pg2> {
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
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: const Center(
          child: Text(
            'Consider using the NEWS service to check local news',
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Pacifico',
                letterSpacing: 2,
                height: 1.3),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
