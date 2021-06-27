import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  RoundedIconButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kActiveCardColor,
    );
  }
}
