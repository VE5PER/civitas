import 'package:civitas/loginpage/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:civitas/profile/profilecontent.dart';
import 'manageaccount.dart';
import 'viewprofile.dart';

class PopUpProfileButton extends StatefulWidget {
  userinfo currentUser;
  PopUpProfileButton(this.currentUser);

  @override
  _PopUpProfileButtonState createState() => _PopUpProfileButtonState();
}

class _PopUpProfileButtonState extends State<PopUpProfileButton> {
  void selectedItem(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('View Profile');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DisplayProfile(
                  widget.currentUser,
                )));
        setState(() {});
        break;
      case 1:
        print('Manage Profile');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ManageAccountPage(
                  widget.currentUser,
                )));
        setState(() {});
        break;
      case 2:
        print('logout');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginUiApp()),
        );
        // Navigator.pop(context);
        break;
    }
  }

  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      child: Padding(
        padding: EdgeInsets.only(right: 4),
        child: CircleAvatar(backgroundImage: widget.currentUser.profilepic),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: Text(widget.currentUser.name),
            subtitle: Text(widget.currentUser.email),
            leading: CircleAvatar(
              backgroundImage: widget.currentUser.profilepic,
              radius: 30,
            ),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(
                Icons.manage_accounts,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Manage account'),
            ],
          ),
          value: 1,
        ),
        const PopupMenuDivider(
          height: 5,
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Logout'),
            ],
          ),
          value: 2,
        ),
      ],
      onSelected: (item) {
        selectedItem(context, item);
      },
    );
  }
}
