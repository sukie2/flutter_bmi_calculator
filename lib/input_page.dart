import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'reusable_icon.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

enum Gender { male, female }

class _FirstPageState extends State<FirstPage> {
  static const bottomContainerHeight = 80.0;
  static const bottomContainerColor = Color(0xFFEB1555);
  static const activeCardColor = Color(0xFF1D1E33);
  static const inActiveCardColor = Color(0xFF111328);

  Gender selectedCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
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
                        ? activeCardColor
                        : inActiveCardColor,
                    child: ReusableIcon(
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
                        ? activeCardColor
                        : inActiveCardColor,
                    child: ReusableIcon(
                      iconName: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }
}
