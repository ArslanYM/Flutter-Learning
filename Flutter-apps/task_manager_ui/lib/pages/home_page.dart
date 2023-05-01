import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager_ui/pages/tasks.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> taskList = [
    Task(isDone: true, taskName: 'Do exercise'),
    Task(isDone: false, taskName: 'study 5 hours'),
    Task(isDone: true, taskName: 'learn to fight '),
    Task(isDone: false, taskName: 'Do exercise'),
    Task(isDone: true, taskName: 'Do exercise'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.grey[100],
          );
        }),
        centerTitle: true,
        title: Text(
          'Daily Goal Manager',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          //text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Yuhuu, your work is almost done!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          //3 divs
          Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: 200,
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepPurple[400],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Text(
                                'My Priority Task',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[400]),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: taskList.length,
                                itemBuilder: ((context, index) => ListTile(
                                      leading: Icon(
                                        taskList[index].isDone
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        taskList[index].taskName,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      child: Container(
                        height: 100,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(12)),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Daily Tasks',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '8 out of 10 done',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                    )
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                child: Icon(
                                  Icons.task_alt_rounded,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //heading for listview
          //listview
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.grey[100],
            ),
            label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt_sharp), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_2), label: ''),
      ], backgroundColor: Colors.black),
    );
  }
}
