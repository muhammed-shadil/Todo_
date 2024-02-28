import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';
import 'package:todo_final/view/widgets/editpage.dart';

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
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: todo!.isComplete,
                        onChanged: (value) {
                          _todoService.updateIsCompleted(todo, index);
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(todo.age),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _todoService.deleteTodo(todo, index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => edit(
                                task: todo.title,
                                desc: todo.age,
                                index: index,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
