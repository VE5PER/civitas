import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  userinfo currentUser;
  ChangePasswordScreen(this.currentUser);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: Text(widget.currentUser.name),
      ),
    );
  }
}
