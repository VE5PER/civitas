import 'package:civitas/sidedrawer.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: draweritems(),


    );
  }
}
