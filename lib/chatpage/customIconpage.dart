import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customListTile extends StatefulWidget {
  customListTile({required this.email, required this.currentUser});
  String email;
  userinfo currentUser;

  @override
  _customListTileState createState() => _customListTileState();
}

class _customListTileState extends State<customListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.email),
      leading: CircleAvatar(
        backgroundImage: widget.currentUser.profilepic,
        radius: 30,
      ),
    );
  }
}
