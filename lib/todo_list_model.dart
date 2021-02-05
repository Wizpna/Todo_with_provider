import 'package:flutter/material.dart';

class TodoTaskModel extends ChangeNotifier{

  List<Task> _task = [];

  List<Task> get allTask => _task;

  void addTask (var task){
    _task.add(task);
    notifyListeners();
  }

  void deleteTask (var task){
    _task.remove(task);
    notifyListeners();
  } 

}

class Task{

  String taskTitle;
  bool isCompleted;

  Task({@required this.taskTitle, this.isCompleted = false});

}