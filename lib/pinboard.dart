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
        height: 250,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
      ),
      items: [pg1(),empty(),empty(),empty()],
    );
  }
}
