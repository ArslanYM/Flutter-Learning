import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade700,
          blurRadius: 15,
          offset: const Offset(
            5,
            5,
          ),
        ),
        const BoxShadow(
          color: Colors.white,
          blurRadius: 15,
          offset: Offset(
            -5,
            -5,
          ),
        ),
      ], borderRadius: BorderRadius.circular(12), color: Colors.grey[300]),
    );
  }
}
