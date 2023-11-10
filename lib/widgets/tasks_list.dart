import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Controle/models/task.dart';
import 'package:Controle/services/firestore.dart';
import 'package:Controle/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final FirestoreService firestoreService;

  TasksList({super.key, required this.firestoreService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getTasks(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(); 
        }

        final taskLists = snapshot.data!.docs;
        List<Task> taskItems = [];

        for (int index = 0; index < taskLists.length; index++) {
          DocumentSnapshot document = taskLists[index];
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          String title = data['taskTitle'];
          String description = data['taskDesc'];
          DateTime date = data['taskDate'].toDate();
          String categoryString = data['taskCategory'];
          bool iscompleted =data['iscompleted'];
          Category category;

          switch (categoryString) {
            case 'personal':
              category = Category.personal;
              break;
            case 'work':
              category = Category.work;
              break;
            case 'shopping':
              category = Category.shopping;
              break;
            default:
              category = Category.others;
          }
          Task task = Task(
            title: title,
            description: description,
            date: date,
            category: category,
            iscompleted:iscompleted,
          );
          taskItems.add(task);
        }

        return ListView.builder(
          itemCount: taskItems.length,

          itemBuilder: (ctx, index) {
     
            return TaskItem(
              task: taskItems[index],
              Delete: () {

                firestoreService.deleteTask(taskLists[index].reference);
                
              },

              Complete: () {
                firestoreService.completeTask(taskLists[index].reference);
              },
            );
          },
        );

      },
    );
  }
}