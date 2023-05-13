import 'package:flutter/material.dart';
import 'package:workout_planner/pages/home_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900,
                offset: Offset(5.0, 5.0),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.grey.shade800,
                offset: Offset(-5.0, -5.0),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.sports_gymnastics,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
