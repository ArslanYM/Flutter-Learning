import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  final child;
  Posts({this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Text(child),
        ),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
