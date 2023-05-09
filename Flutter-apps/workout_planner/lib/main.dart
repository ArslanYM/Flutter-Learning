import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_planner/models/workout_data.dart';
import 'package:workout_planner/pages/home_page.dart';
import 'package:workout_planner/pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: LoadingPage(),
      ),
    );
  }
}
