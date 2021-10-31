import 'package:civitas/sidedrawer.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Card(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.notification_important),
                    SizedBox(width: 10,),
                    Container(
                      width: 250,
                      child: Text(
                          "Local garbage reported full. Authorities will take care of it shortly", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Card(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.notification_important),
                    SizedBox(width: 10,),
                    Container(
                      width: 250,
                      child: Text(
                        "Parking spot marked", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
