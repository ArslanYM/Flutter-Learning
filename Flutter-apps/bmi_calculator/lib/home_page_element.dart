import 'package:flutter/material.dart';

class HomePageElement extends StatelessWidget {
  HomePageElement({@required this.colour, this.cardChild, this.onPress});
  final Function onPress;
  final cardChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
