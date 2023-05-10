import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_planner/models/workout_data.dart';
import 'package:workout_planner/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _workoutNameController = TextEditingController();

  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add new workout'),
              content: TextField(
                controller: _workoutNameController,
              ),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text('cancel'),
                )
              ],
            ));
  }

  void save() {
    String newWorkoutName = _workoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    _workoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Workout planner"),
        ),
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurple[300]),
                  child: ListTile(
                    title: Text(value.getWorkoutList()[index].name),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WorkoutPage(
                                  workoutName:
                                      value.getWorkoutList()[index].name,
                                );
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.navigate_next_outlined,
                          size: 40,
                        )),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
