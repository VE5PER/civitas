import 'dart:io';
import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/material.dart';
import 'popupscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'customwidgets.dart';

class DisplayProfile extends StatefulWidget {
  userinfo currentUser;
  DisplayProfile(this.currentUser);

  @override
  State<DisplayProfile> createState() => _DisplayProfileState();
}

class _DisplayProfileState extends State<DisplayProfile> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _areacontroller = TextEditingController();
  TextEditingController _aadharcontroller = TextEditingController();

  bool _editmode = false;
  @override
  Widget build(BuildContext context) {
    _namecontroller.text = widget.currentUser.name;
    _phonecontroller.text = widget.currentUser.phone;
    _addresscontroller.text = widget.currentUser.address;
    _areacontroller.text = widget.currentUser.location;
    _aadharcontroller.text = widget.currentUser.aadhar;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                InkWell(
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
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: _editmode,
                      controller: _namecontroller,
                      keyboardType: TextInputType.name,
                      onChanged: (str) {
                        widget.currentUser.name = str;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: _editmode,
                      controller: _phonecontroller,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      onChanged: (str) {
                        widget.currentUser.phone = str;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: "Phone",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ), // Phone
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: _editmode,
                      controller: _addresscontroller,
                      keyboardType: TextInputType.text,
                      onChanged: (str) {
                        widget.currentUser.address = str;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                      maxLines: 5,
                    ),
                  ),
                ), //address
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: _editmode,
                      controller: _aadharcontroller,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      onChanged: (str) {
                        widget.currentUser.aadhar = str;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: "Aadhar",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: _editmode,
                      controller: _areacontroller,
                      keyboardType: TextInputType.text,
                      onChanged: (str) {
                        widget.currentUser.location = str;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: "Location",
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                ), //aadhar
              ],
            ),
          ),
        ),
      ),
    );
  }
}
