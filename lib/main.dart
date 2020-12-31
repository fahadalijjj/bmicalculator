import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi/card.dart';
import 'package:flutter_bmi/constaints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender.dart';
import 'vbutton.dart';
import 'navigationbutton.dart';
import 'resultscreen.dart';
import 'resultfunctionality.dart';

void main() {
  runApp((MaterialApp(
    home: BMI(),
    theme: ThemeData.dark().copyWith(
        primaryColor: kprimarycolor, scaffoldBackgroundColor: kscaffoldcolor),
  )));
}

enum eGender { male, female }

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int weightvalue = 0;
  int agevalue = 0;
  int heightvalue = 150;

  eGender selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ReuseableCard(
                  cardcolor: selectedgender == eGender.male
                      ? kactivatedcolor
                      : kunactivatedcolor,
                  function: () {
                    setState(() {
                      selectedgender = eGender.male;
                    });
                  },
                  child: Gender(
                    gendername: 'Male',
                    iconData: FontAwesomeIcons.mars,
                  )),
              ReuseableCard(
                cardcolor: selectedgender == eGender.female
                    ? kactivatedcolor
                    : kunactivatedcolor,
                function: () {
                  setState(() {
                    selectedgender = eGender.female;
                  });
                },
                child: Gender(
                  gendername: 'Female',
                  iconData: FontAwesomeIcons.venus,
                ),
              )
            ],
          ),
          ReuseableCard(
            cardcolor: kcarddcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: cardtextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      heightvalue.toString(),
                      style: kheightvaluestyle,
                    ),
                    Text(
                      'cm',
                      style: kunittextstyle,
                    ),
                  ],
                ),
                Slider(
                    value: heightvalue.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: knavigationbuttoncolor,
                    inactiveColor: cardtextstyle.color,
                    onChanged: (val) {
                      setState(() {
                        heightvalue = val.toInt();
                      });
                    })
              ],
            ),
          ),
          Row(
            children: [
              ReuseableCard(
                cardcolor: kcarddcolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: cardtextstyle,
                    ),
                    Text(
                      weightvalue.toString(),
                      style: kbottomcardvaluestyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        vButton(
                          iconData: Icons.add,
                          function: () {
                            setState(() {
                              weightvalue++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        vButton(
                          iconData: Icons.remove,
                          function: () {
                            setState(() {
                              weightvalue--;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              ReuseableCard(
                cardcolor: kcarddcolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: cardtextstyle,
                    ),
                    Text(
                      agevalue.toString(),
                      style: kbottomcardvaluestyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        vButton(
                          iconData: Icons.add,
                          function: () {
                            setState(() {
                              agevalue++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        vButton(
                          iconData: Icons.remove,
                          function: () {
                            setState(() {
                              agevalue--;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          NavigationButton(
            name: 'CALCULATE',
            navigation: () {
              BrainOfCalculator brain =
                  BrainOfCalculator(weight: weightvalue, height: heightvalue);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmivalue: brain.getBMI(),
                            result: brain.getresult(),
                            recommendation: brain.getRecommendation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
