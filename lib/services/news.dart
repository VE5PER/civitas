
import 'package:civitas/services/news/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
      ),
    );
  }
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Civitas News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

      
    
