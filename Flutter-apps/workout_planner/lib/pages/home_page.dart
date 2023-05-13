import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_planner/components/heatmap.dart';
import 'package:workout_planner/data/workout_data.dart';
import 'package:workout_planner/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<WorkoutData>(context, listen: false).initializeWorkoutList();
  }

  TextEditingController _workoutNameController = TextEditingController();
  @override
  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text('Add new workout'),
              content: TextField(
                decoration: InputDecoration(
                  hintText: 'Workout Name',
                  border: OutlineInputBorder(),
                ),
                controller: _workoutNameController,
              ),
              actions: [
                MaterialButton(
                  color: Colors.black54,
                  onPressed: save,
                  child: Text('Save'),
                ),
                MaterialButton(
                  color: Colors.black54,
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
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: createNewWorkout,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView(
          children: [
            MyHeatmap(
              datasets: value.heatmapDataSet,
              startDateYYYYMMDD: value.getStartDate(),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getWorkoutList().length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[900]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(Icons.sports_gymnastics_rounded),
                          title: Text(
                            value.getWorkoutList()[index].name,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
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
                              icon: const Icon(
                                Icons.navigate_next_outlined,
                                size: 40,
                              )),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
