import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pinboard extends StatefulWidget {
  const pinboard({Key? key}) : super(key: key);

  @override
  _pinboardState createState() => _pinboardState();
}

class _pinboardState extends State<pinboard> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 50),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.amber,
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
