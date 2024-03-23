import 'package:flutter/material.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';
import 'package:todo_final/view/widgets/custom_button.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(
      {super.key,
      required TextEditingController controller,
      required Services todoService,
      required TextEditingController controller2})
      : _controller = controller,
        _todoService = todoService,
        _controller2 = controller2;

  final TextEditingController _controller;
  final TextEditingController _controller2;
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
              contentPadding: const EdgeInsets.all(20),
              title: const Text("Add To do"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                      ),
                      controller: _controller,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                      ),
                      controller: _controller2,
                    ),
                  ],
                ),
              ),
              actions: [
                CustomButton(
                  onpressed: () {
                    Navigator.pop(context);
                  },
                  text: 'cancel',
                ),
                CustomButton(
                    onpressed: () {
                      if (_controller.text.isNotEmpty &&
                          _controller2.text.isNotEmpty) {
                        var todo =
                            TodoModel(_controller.text, _controller2.text);
                        _todoService.addTodo(todo);
                        _controller.clear();
                        _controller2.clear();
                        Navigator.pop(context);
                      }
                    },
                    text: 'Add')
              ],
            );
          },
        );
      },
    );
  }
}
