import 'package:workout_planner/models/exercise.dart';
import 'package:workout_planner/models/workout.dart';

class WorkoutData {
  List<Workout> workoutList = [
    Workout(exercises: [
      Exercise(
          exerciseName: "bicep curls", weight: "15 kgs", reps: "12", sets: "4"),
    ], name: "Pull"),
  ];

  // get the list of workouts
  List getWorkout() {
    return workoutList;
  }

  //lenght of exercises
  int numberOfExercises(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercises.length;
  }

  //add a new workout
  void addWorkout(String name) {
    workoutList.add(Workout(exercises: [], name: "Biceps"));
  }

  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    //finding the workout related to our added exercise
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    relevantWorkout.exercises.add(Exercise(
        exerciseName: exerciseName, weight: weight, reps: reps, sets: sets));
  }

  void checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
  }

  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.exerciseName == exerciseName);

    return relevantExercise;
  }
}
