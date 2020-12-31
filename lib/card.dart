import 'package:flutter/material.dart';
import 'package:flutter_bmi/constaints.dart';

class ReuseableCard extends StatelessWidget {
Widget child;
Function function;
Color cardcolor;

ReuseableCard({this.child,this.function,this.cardcolor});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap:  function,
          child: Container(
            child: child,
            height: 200,
            decoration: BoxDecoration(
                color: cardcolor, borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
