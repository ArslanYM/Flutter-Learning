import 'package:workout_planner/models/exercise.dart';

class Workout {
  final String name;
  final List<Exercise> exercises;

  Workout({required this.exercises, required this.name});
}
