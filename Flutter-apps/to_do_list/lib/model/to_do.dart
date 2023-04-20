import 'package:flutter/material.dart';

class ToDo {
  String id;
  String taskName;
  bool isdone;

  ToDo({required this.id, required this.taskName, this.isdone = false});

   static List<ToDo> toDoList() {
    return [
      ToDo(id: '01', taskName: "exercise", isdone: true),
      ToDo(
        id: '02',
        taskName: "leetcode",
      ),
      ToDo(id: '03', taskName: "run", isdone: true),
      ToDo(id: '03', taskName: "nimaaz", isdone: true),
      ToDo(id: '04', taskName: "record video", isdone: true),
      ToDo(id: '05', taskName: "make juice", isdone: true),
      ToDo(
        id: '06',
        taskName: "call her",
      ),
      ToDo(
        id: '07',
        taskName: "read book",
      ),
      ToDo(
        id: '08',
        taskName: "name ",
      ),
      ToDo(
        id: '09',
        taskName: "lol",
      ),
      ToDo(id: '10', taskName: "exercise", isdone: true)
    ];
  }
}
