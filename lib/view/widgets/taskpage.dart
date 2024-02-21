import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';

class taskpage extends StatelessWidget {
  const taskpage({
    super.key,
    required Services todoService,
  }) : _todoService = todoService;

  final Services _todoService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TodoModel>('todoBox').listenable(),
      builder: (context, Box<TodoModel> box, _) {
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (BuildContext context, int index) {
            var todo = box.getAt(index);
            return ListTile(
              title: Text(todo!.title),
              leading: Checkbox(
                value: todo.isComplete,
                onChanged: (value) {
                  _todoService.updateIsCompleted(todo, index);
                },
              ),
              trailing: IconButton(
                  onPressed: () {
                    _todoService.deleteTodo(todo, index);
                  },
                  icon: const Icon(Icons.delete)),
            );
          },
        );
      },
    );
  }
}
