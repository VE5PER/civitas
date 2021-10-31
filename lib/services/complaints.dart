import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatbot/chatbot.dart';

class complaints extends StatefulWidget {
  const complaints({Key? key}) : super(key: key);

  @override
  _complaintsState createState() => _complaintsState();
}

class _complaintsState extends State<complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMPLAINTS"),
      ),
      body: cbot(),
    );
  }
}
