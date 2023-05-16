// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/di/injection.dart';
import 'package:todo/feature_tasks/domain/model/task.dart';
import 'package:todo/feature_tasks/domain/repository/home_repository.dart';

import 'package:todo/main.dart';

void main() {
 TestWidgetsFlutterBinding.ensureInitialized();
    final HomeRepository _repo=getIt<HomeRepository>();

  group('Create Task', () {
    test('Task should be created in Firestore', () async {
      // Initialize Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // Set up the data for the task
      

      await _repo.createTask(Taskk(
        categ: "Work",
        title: "title",
        date: "06/03/23",
        desc: "fjdjfdjfdjfjdfd"
      ));

      QuerySnapshot snapshot = await firestore.collection('Task').get();

      expect(snapshot.docs.length, 1);

      DocumentSnapshot doc = snapshot.docs[0];
      expect(doc.data(), 'Test Task');
    });
  });

    group('Get All Tasks', () {
    test('Should retrieve all tasks from Firestore', () async {
      // Initialize Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add dummy tasks to Firestore for testing
      await firestore.collection('tasks').add({'title': 'Task 1'});
      await firestore.collection('tasks').add({'title': 'Task 2'});
      await firestore.collection('tasks').add({'title': 'Task 3'});

      // Retrieve all tasks
      List<Taskk> tasks = (await _repo.getAllTasks()) as List<Taskk>;

      // Check the number of tasks retrieved
      expect(tasks.length, 3);

      // Verify the task titles
      expect(tasks[0], 'Task 1');
      expect(tasks[1], 'Task 2');
      expect(tasks[2], 'Task 3');
    });
  });
}










