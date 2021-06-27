import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bmi_calculator/bmi_result.dart';
import 'package:flutter_bmi_calculator/widgets/primary_button.dart';
import 'package:flutter_bmi_calculator/widgets/reusable_card.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  final BMIResult result;

  ResultsPage({@required this.result});

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
                    result.level,
                    style: kResultStyle,
                  ),
                  Text(
                    result.calculation,
                    style: kResultBMIStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      result.advice,
                      style: adviceTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          PrimaryButton(
            buttonText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
