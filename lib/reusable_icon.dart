import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData iconName;
  final String iconText;

  final TextStyle style = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

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
          style: style,
        ),
      ],
    );
  }
}
