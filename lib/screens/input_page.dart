import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_engine.dart';
import 'package:flutter_bmi_calculator/screens/results_page.dart';
import 'package:flutter_bmi_calculator/widgets/primary_button.dart';
import 'package:flutter_bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter_bmi_calculator/widgets/reusable_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/rounded_icon_button.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

enum Gender { male, female }

class _FirstPageState extends State<FirstPage> {
  Gender selectedCard;
  double height = 160;
  double weight = 60;
  double age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedCard = Gender.male;
                      });
                    },
                    color: selectedCard == Gender.male
                        ? kActiveCardColor
                        : inActiveCardColor,
                    cardChild: ReusableIcon(
                      iconName: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                    color: selectedCard == Gender.female
                        ? kActiveCardColor
                        : inActiveCardColor,
                    cardChild: ReusableIcon(
                      iconName: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: labelStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    activeColor: accentColor,
                    min: 120,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
              color: inActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: inActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Text(
                          weight.round().toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: inActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          age.round().toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            buttonText: 'CALCULATE',
            onTap: () {
              BMIEngine engine = BMIEngine(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: engine.calculateBMI(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
