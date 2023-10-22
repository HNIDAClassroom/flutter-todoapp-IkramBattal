import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

class NewTask extends StatefulWidget {
  final Function(Task) addTask;
  const NewTask(this.addTask, {Key? key}) : super(key: key);
  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitTaskData() {

    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Task Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Task Description',
            ),
          ),

          ElevatedButton(
            onPressed: _submitTaskData,
            child: const Text('Save Task'),
          ),
        ],
      ),
    );
  }
}