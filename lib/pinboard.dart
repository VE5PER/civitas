import 'package:carousel_slider/carousel_slider.dart';
import 'package:civitas/pinboarditems/empty.dart';
import 'package:civitas/pinboarditems/pg1.dart';
import 'package:civitas/pinboarditems/pg2.dart';
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
      options: CarouselOptions(
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,

      ),
      items: [pg1(),pg2(),empty(),empty()],
    );
  }
}
