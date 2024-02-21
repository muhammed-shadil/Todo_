import 'package:flutter/material.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required TextEditingController controller,
    required Services todoService,
  })  : _controller = controller,
        _todoService = todoService;

  final TextEditingController _controller;
  final Services _todoService;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("add todo"),
              content: TextFormField(
                autofocus: true,
                controller: _controller,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel "),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      var todo = TodoModel(_controller.text);
                      _todoService.addTodo(todo);
                      _controller.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("add "),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
