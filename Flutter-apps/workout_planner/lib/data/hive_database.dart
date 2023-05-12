import 'package:hive/hive.dart';
import 'package:workout_planner/datetime/date_time.dart';
import 'package:workout_planner/models/exercise.dart';
import 'package:workout_planner/models/workout.dart';

class HiveDatase {
  final _myBox = Hive.box('workout-database');
  bool previousDataExists() {
    if (_myBox.isEmpty) {
      print('prev data doesnt exist');
      _myBox.put("START-DATE", todaysDateYYYYMMDD());
      return false;
    } else {
      print("prev data exists");
      return true;
    }
  }

  String getStartDate() {
    return _myBox.get("START-DATE");
  }

  void saveToDatabase(List<Workout> workouts) {
    final workoutList = convertObjectToWorkoutList(workouts);
    final exerciseList = convertObjectToExerciseList(workouts);

    if (exerciseCompleted(workouts)) {
      _myBox.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 1);
    } else {
      _myBox.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 0);
    }

    _myBox.put("WORKOUTS", workoutList);
    _myBox.put("EXERCISES", exerciseList);
  }
  
  


  bool exerciseCompleted(List<Workout> workouts) {
    for (var workout in workouts) {
      for (var exercise in workout.exercises) {
        if (exercise.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }
}

//conversion of workout object to a list
List convertObjectToWorkoutList(List<Workout> workouts) {
  List<String> workoutList = [];
  for (var i = 0; i < workouts.length; i++) {
    workoutList.add(workouts[i].name);
  }
  return workoutList;
}

//convert the exercised in  a workout object to a list of strings

List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
  //List of workouts[List of Exercises[ Exercises[biceps,reps,sets,etc],[]],[]]
  List<List<List<String>>> exerciseList = [];
  for (int i = 0; i < workouts.length; i++) {
    //take the exercises out of workout
    List<Exercise> exerciseInWorkout = workouts[i].exercises;
    //take the each workout in a particular exercise out
    List<List<String>> individualWorkout = [];
    for (int j = 0; j < exerciseInWorkout.length; j++) {
      List<String> individualExercise = [];
      individualExercise.addAll(
        [
          exerciseInWorkout[j].exerciseName,
          exerciseInWorkout[j].reps,
          exerciseInWorkout[j].sets,
          exerciseInWorkout[j].weight,
          exerciseInWorkout[j].isCompleted.toString()
        ],
      );
      individualWorkout.add(individualExercise);
    }
    exerciseList.add(individualWorkout);
  }
  return exerciseList;
}
