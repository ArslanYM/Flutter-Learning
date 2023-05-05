import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey[500]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    );
  }
}
