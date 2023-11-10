import 'package:flutter/material.dart';
import 'package:Controle/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});

  final void Function(Task task) onAddTask;

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  Category _selectedCategory = Category.personal;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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
    widget.onAddTask(
      Task(
        title: _titleController.text,
        description: _descriptionController.text,
        date: _selectedDate, 
        category: _selectedCategory,
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
    child: Column(
    children: [
    DropdownButton<Category>(
    value: _selectedCategory,
    items: Category.values
    .map((category) => DropdownMenuItem<Category>(
    value: category,
    child: Text(
    category.name.toUpperCase(),
    ),
    ))
        .toList(),
    onChanged: (value) {
    if (value == null) {
    return;
    }
    setState(() {
    _selectedCategory = value;
    });
    },
    ),
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
    ),),

  ElevatedButton(
  onPressed: _submitTaskData,
  child: const Text('Save Task'),
  ),
  ElevatedButton(
  onPressed: () => _selectDate(context),
  child: const Text('Select Date'),
  ),
 
  ],
  ),
  );
}
}
