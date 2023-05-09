class Exercise {
  String exerciseName;
  String weight;
  String reps;
  String sets;
  bool isCompleted;

  Exercise(
      {required this.exerciseName,
      required this.weight,
      required this.reps,
      required this.sets,
      this.isCompleted=false});
}
