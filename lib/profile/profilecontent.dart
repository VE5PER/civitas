import 'package:flutter/cupertino.dart';

class userinfo {
  String name = '';
  String email = '';
  String phone = '';
  String aadhar = '';
  String address = '';
  String location = '';
  String _password = 'dummy';
  ImageProvider profilepic = AssetImage('assets/images/blank_profile.png');

  void setProfile(image) {
    this.profilepic = image;
  }

  String getPassword() {
    return _password;
  }

  String setPassword({currentPassword, newPassword, confirmNewPassword}) {
    String ret;
    if (newPassword == confirmNewPassword) {
      if (currentPassword == _password) {
        _password = currentPassword;
        ret = 'Password Changed Successfully!';
      } else {
        ret = 'Current password is not matching!!';
      }
    } else {
      ret = 'New Passwords, are not matching';
    }
    return ret;
  }

  userinfo({required this.name, required this.email, required this.location});
}
