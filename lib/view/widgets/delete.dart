import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';

class delete extends StatelessWidget {
  const delete({
    super.key,
    required Services todoService,
  }) : _todoService = todoService;

  final Services _todoService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TodoModel>('deletedTodoBox').listenable(),
      builder: (context, Box<TodoModel> box, _) {
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (BuildContext context, int index) {
            var todo = box.getAt(index);
            return ListTile(
              title: Text(todo!.title),
                subtitle: Text(todo.age),
              leading: IconButton(
                icon: const Icon(Icons.restore),
                onPressed: () {
                  _todoService.restoreTodoFromDeleted(todo, index);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_sweep_outlined),
                onPressed: () {
                  _todoService.deleteTodoFromDeleted(index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
