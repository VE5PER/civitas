import 'package:civitas/profile/customwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class garbagemanwidget extends StatelessWidget {
  double pinPillPosition=-100;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedPositioned(
        bottom: pinPillPosition,
        right: 0,
        left: 0,
        duration: Duration(milliseconds: 200),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: <BoxShadow>[
                  BoxShadow(blurRadius: 20,offset: Offset.zero,color: Colors.grey.withOpacity(0.5))
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: roundedButton(
                      buttonColor: Colors.indigo,
                      buttonText: 'Report Bin Full',
                      returnValue: 'Report Bin Full',
                    )
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
