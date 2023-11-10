import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Controle/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback Delete;
  final VoidCallback Complete;

  TaskItem({required this.task, required this.Delete, required this.Complete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(task.description),
            Text('Date: ${DateFormat('yyyy-MM-dd').format(task.date)}'),
            Text('Category: ${task.category}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: task.iscompleted,
              onChanged: (bool? value) {
                Complete();
              },
            ),
         
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: Delete,
            ),
          ],
        ),
      ),
    );
  }
}
