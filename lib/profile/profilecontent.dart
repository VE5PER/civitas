import 'package:flutter/cupertino.dart';

class userinfo {
  String name = '';
  String email = '';
  ImageProvider profilepic = AssetImage('assets/images/blank_profile.png');

  void setProfile(image) {
    this.profilepic = image;
  }

  userinfo({required this.name, required this.email});
}
