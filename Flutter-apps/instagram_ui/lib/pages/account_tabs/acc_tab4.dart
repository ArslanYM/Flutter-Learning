import 'package:flutter/material.dart';

class AccountTab4 extends StatelessWidget {
  AccountTab4({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.greenAccent[100],
            ),
          );
        });
  }
}
