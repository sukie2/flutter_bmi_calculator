import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableIcon extends StatelessWidget {
  final IconData iconName;
  final String iconText;

  ReusableIcon({this.iconName, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: labelStyle,
        ),
      ],
    );
  }
}
