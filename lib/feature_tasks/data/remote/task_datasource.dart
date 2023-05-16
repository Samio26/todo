import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/feature_tasks/data/remote/task_dto.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';


class TaskDataSource{


  Future<Unit> createTask(Taskk task)async{
    await FirebaseFirestore.instance.collection("Task").add({
      "title":task.title,
      "desc":task.desc,
      "date":task.date,
      "categ":task.categ
    });
    return Future.value(unit);
  }

Future<List<TaskDto>> getAllTasks()async {
  QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('Task').get();

  List<TaskDto> taskList = [];

  snapshot.docs.forEach((doc) {
    TaskDto product = TaskDto.fromJson(doc.data());
    taskList.add(product);
  });
  return taskList;
}
}