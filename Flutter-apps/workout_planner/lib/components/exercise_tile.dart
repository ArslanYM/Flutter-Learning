import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String workoutName;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckboxChanged;
  ExerciseTile({
    required this.exerciseName,
    required this.reps,
    required this.workoutName,
    required this.isCompleted,
    required this.sets,
    required this.onCheckboxChanged,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: Text(exerciseName),
          subtitle: Row(children: [
            Chip(
              label: Text("${weight}kg"),
            ),
            Chip(
              label: Text("${reps}reps"),
            ),
            Chip(
              label: Text("${sets}sets"),
            ),
          ]),
          trailing: Checkbox(
              value: isCompleted,
              onChanged: (value) => onCheckboxChanged!(value)),
        ),
      ),
    );
  }
}
