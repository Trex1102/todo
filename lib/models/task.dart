import 'package:flutter/material.dart';
import 'category.dart';

class Task {
  String title;
  String? description;
  Category? category;
  DateTime dateOfCreation;
  TimeOfDay timeOfCreation;
  DateTime dateOfTask;
  TimeOfDay timeOfTask;
  DateTime dateOfReminder;
  TimeOfDay timeOfReminder;
  String? reminderNote;
  String? location;
  bool? isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.category,
    required this.dateOfCreation,
    required this.timeOfCreation,
    required this.dateOfTask,
    required this.timeOfTask,
    required this.dateOfReminder,
    required this.timeOfReminder,
    required this.reminderNote,
    required this.location,
    required this.isCompleted,
  });
}

class ListOfTasks {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  }
}
