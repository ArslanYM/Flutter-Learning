import 'package:flutter/material.dart';

class AccountTab2 extends StatelessWidget {
  const AccountTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.blueGrey[100],
            ),
          );
        });
  }
}
