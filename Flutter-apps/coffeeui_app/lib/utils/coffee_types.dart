import 'package:flutter/material.dart';

class CoffeeTypes extends StatelessWidget {
  CoffeeTypes(
      {this.coffeeTypeName = 'randomName',
      required this.isSelected,
      required this.onSelected});
  final String coffeeTypeName;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          coffeeTypeName,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.grey),
        ),
      ),
    );
  }
}
