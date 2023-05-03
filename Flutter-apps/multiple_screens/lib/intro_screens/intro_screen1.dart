import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.asset('lib/lotties/finding_data.json'),
      ),
      color: Colors.blue[500],
    );
  }
}
