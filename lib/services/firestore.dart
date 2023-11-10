import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService{
final CollectionReference tasks= FirebaseFirestore.instance.collection('tasks');
Future<void> addTask(Task task) {
    return tasks.add({
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.name,
      'taskDate': task.date,
      'iscompleted':task.iscompleted,
    });
  }
Future<void> deleteTask(DocumentReference document) {
    return document.delete();
  }
Future<void> completeTask(DocumentReference document) {
    return document.update({
      'iscompleted': true,
    });
  }
Stream <QuerySnapshot> getTasks(){

final taskStream= tasks.snapshots();
return taskStream;

}

}