import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  MyPost({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[300], shape: BoxShape.circle),
              ),
              SizedBox(
                width: 20,
              ),
              Text(text),
            ],
          ),
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(color: Colors.grey[400]),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.ques,
                    size: 40,
                  )
                ],
              ),
              Row()
            ],
          ),
        ),
      ],
    );
  }
}
