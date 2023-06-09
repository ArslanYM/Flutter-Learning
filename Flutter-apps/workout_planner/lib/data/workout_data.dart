import 'package:flutter/material.dart';
import 'package:workout_planner/data/hive_database.dart';
import 'package:workout_planner/datetime/date_time.dart';
import 'package:workout_planner/models/exercise.dart';
import 'package:workout_planner/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  final db = HiveDatase();
  //extends change notifier because addint items and removing makes state changes to the app ui
  List<Workout> workoutList = [
    Workout(name: "Pull", exercises: [
      Exercise(
          exerciseName: "bicep curls", weight: "15", reps: "12", sets: "4"),
    ]),
    Workout(name: "push", exercises: [
      Exercise(
          exerciseName: "tricep skull crushers",
          weight: "15",
          reps: "12",
          sets: "4"),
    ]),
  ];

  void initializeWorkoutList() {
    if (db.previousDataExists()) {
      workoutList = db.readFromDatabase();
    } else {
      db.saveToDatabase(workoutList);
    }
    loadHeatMap();
  }

  // get the list of workouts
  List getWorkoutList() {
    return workoutList;
  }

  //length of exercises
  int numberOfExercises(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercises.length;
  }

  //add a new workout
  void addWorkout(String name) {
    workoutList.add(Workout(exercises: [], name: name));
    notifyListeners();
    db.saveToDatabase(workoutList);
  }

  //add exercise to workout with its details
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    //finding the workout related to our added exercise
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(Exercise(
        exerciseName: exerciseName, weight: weight, reps: reps, sets: sets));
    notifyListeners();
    db.saveToDatabase(workoutList);
  }

  // to checkoff the exercise as compeleted , find the workout => exercise => mark completed
  void checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();
    db.saveToDatabase(workoutList);
    loadHeatMap();
  }

  //getting relevant workouts and exercises from the workoutlist to add/remove items bases on their names
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  //exercises lie inside workout so we need both workout and exercise name
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.exerciseName == exerciseName);

    return relevantExercise;
  }

  String getStartDate() {
    return db.getStartDate();
  }

  Map<DateTime, int> heatmapDataSet = {};
  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(getStartDate());
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBetween; i++) {
      String yyyymmdd = dateTimeString(startDate.add(Duration(days: 1)));

      int completionStatus = db.getCompletionStatus(yyyymmdd);
      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): completionStatus
      };
      heatmapDataSet.addEntries(percentForEachDay.entries);
    }
  }
}
