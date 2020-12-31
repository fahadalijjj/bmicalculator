import 'package:flutter/material.dart';
import 'constaints.dart';


class NavigationButton extends StatelessWidget {
  String name;
  Function navigation;

  NavigationButton({this.name,this.navigation});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: knavigationbuttoncolor,
      child: FlatButton(
        child: Text(
            name,
            style: knavigationbuttontextstyle
        ),
        onPressed: navigation
      ),
      height: 70,
    );
  }
}
