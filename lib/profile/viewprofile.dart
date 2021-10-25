import 'dart:io';
import 'package:civitas/profile/profilecontent.dart';
import 'package:flutter/material.dart';
import 'popupscreen.dart';
import 'package:image_picker/image_picker.dart';

class DisplayProfile extends StatefulWidget {
  userinfo currentUser;
  DisplayProfile(this.currentUser);

  @override
  State<DisplayProfile> createState() => _DisplayProfileState();
}

class _DisplayProfileState extends State<DisplayProfile> {
  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
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
                        final XFile? image =
                            await _picker.pickImage(source: sel);
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
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.currentUser.name),
                    Text(widget.currentUser.email),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
