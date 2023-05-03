import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Lottie.network(
              'https://assets9.lottiefiles.com/datafiles/s2s8nJzgDOVLOcz/data.json')),
      color: Color.fromARGB(255, 59, 143, 212),
    );
  }
}
