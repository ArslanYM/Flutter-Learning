import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String iconText;
  final buttonTapped;

  MyButton(
      {this.color, required this.iconText, this.textColor, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[100],
      onTap: buttonTapped,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            iconText,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
