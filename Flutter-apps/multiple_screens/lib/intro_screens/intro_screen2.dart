import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_d8bmxmlo.json'),
          ),
        ),
        color: Colors.yellow);
  }
}
