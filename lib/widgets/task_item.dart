import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem(this.task, {super.key});
  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: Text(task.title),
      );

  }
}