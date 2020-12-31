import 'package:flutter/material.dart';
import 'constaints.dart';
class vButton extends StatelessWidget {
  Function function;
  IconData iconData;

  vButton({this.function, this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: kbuttoncolor,
          shape: BoxShape.circle,
        ),
        child: RawMaterialButton(
          onPressed: function,
          child: Icon(
            iconData,
            size: 45,
          ),
        ));
  }
}
