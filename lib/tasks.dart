import 'package:flutter/material.dart';
import 'package:Controle/services/firestore.dart';
import 'package:Controle/widgets/new_task.dart';
import 'package:Controle/widgets/tasks_list.dart';
import 'package:Controle/models/task.dart';
class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  void _addTask(Task task) {
    firestoreService.addTask(task); 
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ToDoList'),
        actions: [
          IconButton(
            onPressed: _openAddTaskOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          TasksList(firestoreService: firestoreService), 
        ],
      ),
    );
  }
}
