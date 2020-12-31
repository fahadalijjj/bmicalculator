import 'package:flutter/material.dart';
import 'constaints.dart';

class Gender extends StatelessWidget {

  IconData iconData;
  String gendername;

  Gender({this.gendername,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: kiconcolor,
          size: 120,
        ),
        Text(
          gendername,
          style: cardtextstyle,
        )
      ],
    );
  }
}
