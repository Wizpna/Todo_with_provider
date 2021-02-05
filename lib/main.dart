import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/todo_list.dart';
import 'package:test_provider/todo_list_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (BuildContext context) => TodoTaskModel(),
          child: MaterialApp(
        title: 'Flutter Demo',
        home: TodoList(),
      ),
    );
  }
}
