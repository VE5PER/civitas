import 'dart:io';

import 'package:civitas/profile/changepassword.dart';
import 'package:civitas/profile/customwidgets.dart';
import 'package:civitas/profile/popupscreen.dart';
import 'package:civitas/profile/viewprofile.dart';
import 'package:flutter/material.dart';
import 'package:civitas/profile/profilecontent.dart';
import 'package:image_picker/image_picker.dart';

class ManageAccountPage extends StatefulWidget {
  userinfo currentUser;
  ManageAccountPage(this.currentUser);

  @override
  _ManageAccountPageState createState() => _ManageAccountPageState();
}

class _ManageAccountPageState extends State<ManageAccountPage> {
  bool _editmode = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text('Manage account'),
        actions: [
          IconButton(
            icon: Icon(_editmode ? Icons.done : Icons.edit),
            onPressed: () {
              setState(() {
                _editmode = !_editmode;
              });
            },
          )
        ],
      ),
      body: Container(
        child: Card(
          shadowColor: Colors.black,
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    String selected = await showModalBottomSheet(
                      context: context,
                      builder: (context) => PopUpScreen(),
                    );
                    print(selected);
                    if (selected == 'null') {
                      print('No change');
                    } else {
                      var sel = ImageSource.gallery;
                      sel = selected == 'Gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera;
                      final ImagePicker _picker = ImagePicker();
                      final XFile? image = await _picker.pickImage(source: sel);
                      var path = File(image!.path);
                      ImageProvider newImage = FileImage(path);
                      widget.currentUser.setProfile(newImage);
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                      radius: 50,
                      child: Container(
                        child: const Text(
                          'EDIT',
                          style: TextStyle(
                              backgroundColor: Colors.white,
                              color: Colors.blue),
                        ),
                      ),
                      backgroundImage: widget.currentUser.profilepic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.green,
                  elevation: 5,
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.alternate_email,
                      color: Colors.white,
                    ),
                    title: Text(
                      '${widget.currentUser.email}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    buttonColor: Colors.blue,
                    buttonText: 'Personal Info',
                    onPressed: DisplayProfile(widget.currentUser),
                    icon: Icons.perm_identity,
                    currentUser: widget.currentUser),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  buttonColor: Colors.blue,
                  buttonText: 'Change Password',
                  icon: Icons.admin_panel_settings_outlined,
                  currentUser: widget.currentUser,
                  onPressed: ChangePasswordScreen(widget.currentUser),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
