import 'package:civitas/sidedrawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class rateus extends StatefulWidget {
  const rateus({Key? key}) : super(key: key);

  @override
  _rateusState createState() => _rateusState();
}

class _rateusState extends State<rateus> {
  var rating=3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Us',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: draweritems(),
      /*body: Center(
        child: SmoothStarRating(
          allowHalfRating: true,
          onRated: (value){},
          starCount: 5,
          rating: rating,
          size: 40.0,
          isReadOnly: false,
          filledIconData: Icons.star_rate_rounded,
          halfFilledIconData: Icons.star_half_rounded,
          color: Colors.blueAccent,
          borderColor: Colors.indigo,
          spacing: 2.0,
        ),
      ),*/
    );
  }
}
