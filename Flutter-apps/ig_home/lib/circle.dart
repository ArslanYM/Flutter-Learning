import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final child;
  Circle({this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        child: Center(
          child: Text(child),
        ),
        height: 300,
        decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
      ),
    );
  }
}
