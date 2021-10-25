import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class draweritems extends StatefulWidget {
  const draweritems({Key? key}) : super(key: key);

  @override
  _draweritemsState createState() => _draweritemsState();
}

class _draweritemsState extends State<draweritems> {
  final padding=EdgeInsets.symmetric(horizontal: 25,vertical: 25);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.indigoAccent,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 18),
            listViewItems(
              text: 'Notifications',
              icon: Icons.notifications_active,
            ),
            const SizedBox(height: 18),
            listViewItems(
              text: 'Home',
              icon: Icons.home_rounded,
            ),
            const SizedBox(height: 18),
            listViewItems(
              text: 'Settings',
              icon: Icons.settings,
            ),
            const SizedBox(height: 35),
            Divider(color: Colors.white,),
            const SizedBox(height: 18),
            listViewItems(
              text: 'Report an Issue',
              icon: Icons.bug_report_rounded,
            ),
            const SizedBox(height: 18),
            listViewItems(
              text: 'About Us',
              icon: Icons.info_rounded,
            ),
            const SizedBox(height: 20),
            listViewItems(
              text: 'Rate Us',
              icon: Icons.star_rate_rounded,
            ),
          ],
        ),

      ),
    );
  }
  Widget listViewItems(
  { required String text,
    required IconData icon,
    VoidCallback? onClicked,
}){
    final color=Colors.white;
    final hoverColor=Colors.white60;
    return ListTile(
      leading: Icon(icon,color:color),
      title: Text(text,style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: (){},
    );
  }
}
