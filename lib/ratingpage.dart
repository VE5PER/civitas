
import 'package:flutter/material.dart';

class rateus extends StatefulWidget {
  const rateus({Key? key}) : super(key: key);

  @override
  _rateusState createState() => _rateusState();
}

class _rateusState extends State<rateus> {
  var rating=3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Us',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
      ),


    );
  }
}
