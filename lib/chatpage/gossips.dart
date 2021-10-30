import 'package:civitas/chatpage/customIconpage.dart';
import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gossips extends StatefulWidget {
  userinfo currentUser;
  gossips(this.currentUser);
  @override
  _gossipsState createState() => _gossipsState();
}

class _gossipsState extends State<gossips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("GOSSIPS"),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) => customListTile(
          email: 'dummyEmail',
          currentUser: widget.currentUser,
        ),
      )),
    );
  }
}
