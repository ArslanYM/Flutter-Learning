import 'package:flutter/material.dart';
import 'package:to_do_list/constants/colors.dart';
import '../model/to_do.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDelete,
  });
  final ToDo todo;
  final onToDoChanged;
  final onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        leading: Icon(
          todo.isdone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: tdBlue,
          size: 25,
        ),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        title: Text(
          todo.taskName,
          style: TextStyle(
              fontSize: 16,
              decoration: todo.isdone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          // padding: EdgeInsets.all(0),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            iconSize: 20,
            onPressed: () {
              onDelete(todo.id);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
