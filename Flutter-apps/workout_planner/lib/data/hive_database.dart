import 'package:hive/hive.dart';
import 'package:workout_planner/datetime/date_time.dart';
import 'package:workout_planner/models/exercise.dart';
import 'package:workout_planner/models/workout.dart';

class HiveDatase {
  final _myBox = Hive.box('workout-database1');
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

  List<Workout> readFromDatabase() {
    List<Workout> mySavedWorkouts = [];
    //get saved workouts
    List<String> workoutNames = _myBox.get('WORKOUTS');
    final exerciseDetails = _myBox.get('EXERCISES');
    //creating workout objects from saved lists
    for (int i = 0; i < workoutNames.length; i++) {
      //for each workout there are multiple exercises
      List<Exercise> exercisesInEachWorkout = [];
      for (int j = 0; j < exerciseDetails[i].length; j++) {
        exercisesInEachWorkout.add(
          Exercise(
            exerciseName: exerciseDetails[i][j][0],
            weight: exerciseDetails[i][j][1],
            reps: exerciseDetails[i][j][2],
            sets: exerciseDetails[i][j][3],
            isCompleted: exerciseDetails[i][j][4] == "true" ? true : false,
          ),
        );
      }
      //create individual workout
      Workout workout =
          Workout(exercises: exercisesInEachWorkout, name: workoutNames[i]);
      mySavedWorkouts.add(workout);
    }
    return mySavedWorkouts;
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

  int getCompletionStatus(String yyyymmdd) {
    int completionStatus = _myBox.get("COMPLETION_STATUS_$yyyymmdd") ?? 0;
    return completionStatus;
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

//convert the exercises in  a workout object to a list of strings
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
