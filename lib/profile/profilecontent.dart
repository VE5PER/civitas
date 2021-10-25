import 'package:flutter/cupertino.dart';

class userinfo {
  String name = '';
  String email = '';
  String phone = '';
  String aadhar = '';
  String address = '';
  String location = '';
  ImageProvider profilepic = AssetImage('assets/images/blank_profile.png');

  void setProfile(image) {
    this.profilepic = image;
  }

  userinfo({required this.name, required this.email, required this.location});
}
