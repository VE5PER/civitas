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
      options: CarouselOptions(height: 250, scrollDirection: Axis.horizontal),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orangeAccent),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
                child: Center(
                  child: Text(
                    'Text $i',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
