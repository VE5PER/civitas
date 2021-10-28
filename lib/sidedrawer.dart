import 'package:civitas/aboutus.dart';
import 'package:civitas/homepage.dart';
import 'package:civitas/notifications.dart';
import 'package:civitas/ratingpage.dart';
import 'package:civitas/reportIssue.dart';
import 'package:civitas/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class draweritems extends StatefulWidget {
  const draweritems({Key? key}) : super(key: key);

  @override
  _draweritemsState createState() => _draweritemsState();
}

class _draweritemsState extends State<draweritems> {
  final padding = EdgeInsets.symmetric(horizontal: 25, vertical: 25);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xff6a11cb),
                Color(0xff2575fc),
              ])),
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 18),
              listViewItems(
                text: 'Notifications',
                icon: Icons.notifications_active,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 18),
              listViewItems(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 35),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(height: 18),
              listViewItems(
                text: 'Report an Issue',
                icon: Icons.bug_report_rounded,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 18),
              listViewItems(
                text: 'About Us',
                icon: Icons.info_rounded,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 20),
              listViewItems(
                text: 'Rate Us',
                icon: Icons.star_rate_rounded,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 20),
              listViewItems(
                text: 'Tell a friend',
                icon: Icons.share_rounded,
                onClicked: () => selectedItem(context, 5),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewItems({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white60;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 18)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => notification(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => settings(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => reportissue(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => aboutus(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => rateus(),
        ));
        break;
    }
  }
}
