import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  String resultStr = 'OVERWEIGHT';
  String bmiResultStr = '26.7';
  String adviceString =
      'You have more than normal body weight, try to exercise more.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: kTitleStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultStr,
                    style: kResultStyle,
                  ),
                  Text(
                    bmiResultStr,
                    style: kResultBMIStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      adviceString,
                      style: adviceTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 60.0,
            color: accentColor,
            alignment: Alignment.center,
            child: Text(
              'RE-CALCULATE',
              style: kButtonTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
