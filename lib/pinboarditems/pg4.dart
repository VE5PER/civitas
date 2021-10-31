import 'package:flutter/cupertino.dart';

class pg4 extends StatefulWidget {
  const pg4({Key? key}) : super(key: key);

  @override
  _pg4State createState() => _pg4State();
}

class _pg4State extends State<pg4> {
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
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: const Center(
          child: Text(
            'You can use the AI-powered Chat-Bot to request assistance',
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Pacifico',
                letterSpacing: 3,
                height: 1.3),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
