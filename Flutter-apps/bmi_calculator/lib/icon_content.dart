import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.symbol, this.label});
  @override
  final IconData symbol;
  final String label;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 80.0,
          color: Colors.grey.shade200,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 15.0, color: Colors.grey.shade200),
        ),
      ],
    );
  }
}
