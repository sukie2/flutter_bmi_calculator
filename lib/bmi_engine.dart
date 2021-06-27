import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bmi_calculator/bmi_result.dart';

class BMIEngine {
  final double weight;
  final double height;
  double _bmi;
  BMIResult _result = BMIResult();

  BMIEngine({@required this.weight, @required this.height});

  BMIResult calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    _result.calculation = _bmi.toStringAsFixed(1);
    if (_bmi >= 25) {
      _result.level = 'Overweight';
      _result.advice =
          'You have more than normal body weight, try to exercise more.';
    } else if (_bmi > 18.5) {
      _result.level = 'Normal';
      _result.advice = 'You have a normal body weight. Good job!';
    } else {
      _result.level = 'Underweight';
      _result.advice =
          'You have less than normal body weight, try to eat more.';
    }
    return _result;
  }
}
