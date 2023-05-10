import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_planner/components/exercise_tile.dart';
import 'package:workout_planner/models/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  WorkoutPage({required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  void onCheckboxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _setsController = TextEditingController();

  void addExercise() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add a new exercise'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _exerciseNameController,
                  ),
                  TextField(
                    controller: _weightController,
                  ),
                  TextField(
                    controller: _repsController,
                  ),
                  TextField(
                    controller: _setsController,
                  ),
                ],
              ),
              actions: [
                MaterialButton(onPressed: save, child: Text("save")),
                MaterialButton(onPressed: cancel, child: Text("cancel")),
              ],
            ));
  }

  void save() {
    String newExerciseName = _exerciseNameController.text;
    String newWeight = _weightController.text;
    String newSets = _setsController.text;
    String newReps = _repsController.text;
    Provider.of<WorkoutData>(context, listen: false).addExercise(
      widget.workoutName,
      newExerciseName,
      newWeight,
      newReps,
      newSets,
    );
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    _exerciseNameController.clear();
    _repsController.clear();
    _weightController.clear();
    _setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.workoutName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addExercise,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.numberOfExercises(widget.workoutName),
          itemBuilder: (context, index) => ExerciseTile(
            workoutName: widget.workoutName,
            exerciseName: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .exerciseName,
            isCompleted: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .isCompleted,
            reps: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .reps,
            sets: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .sets,
            weight: value
                .getRelevantWorkout(widget.workoutName)
                .exercises[index]
                .weight,
            onCheckboxChanged: (val) => onCheckboxChanged(
                widget.workoutName,
                value
                    .getRelevantWorkout(widget.workoutName)
                    .exercises[index]
                    .exerciseName),
          ),
        ),
      );
    });
  }
}
