import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/todo_list_model.dart';

class TodoList extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoTaskModel todos = Provider.of<TodoTaskModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App with Provider'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: todos.allTask.length,
                    itemBuilder: (context, index) => ListTile(
                          title:
                              Text(todos.allTask[index].taskTitle.toString()),
                          trailing: FlatButton(
                            onPressed: () {
                              todos.deleteTask(todos.allTask[index]);
                            },
                            child: Text('Remove Task'),
                          ),
                          leading: CircleAvatar(
                              radius: 15,
                              child: Text(
                                (1 + index).toString(),
                                style: TextStyle(fontSize: 14),
                              )),
                        )),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Flexible(
                      child: TextField(
                    controller: textEditingController,
                  )),
                  RaisedButton(
                    onPressed: () {
                      if (textEditingController.text != '' ||
                          textEditingController.text.toString().isNotEmpty) {
                        todos.addTask(
                            Task(taskTitle: textEditingController.text));
                        textEditingController.clear();
                      } else {
                        return null;
                      }
                    },
                    child: Text('Add'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
