import 'package:flutter/material.dart';
import 'card.dart';
import 'constaints.dart';
import 'navigationbutton.dart';


class ResultScreen extends StatelessWidget {

  String result;
  String bmivalue;
  String recommendation;

  ResultScreen({this.result,this.recommendation,this.bmivalue});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Your Result', style: kresultscreentextstyle),
        ),
        ReuseableCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                result,
                style: kresulttextstyle,
              ),
              Text(
                bmivalue,
                style: kbmivaluetextstyle,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  recommendation,
                  textAlign: TextAlign.center,
                  style: krecommendationtextstyle,
                ),
              )
            ],
          ),
          cardcolor: kcarddcolor,
        ),
        NavigationButton(
          name: 'RECALCULATE',
          navigation: () {
            Navigator.pop(context);
          },
        )
      ])),
    );
  }
}
