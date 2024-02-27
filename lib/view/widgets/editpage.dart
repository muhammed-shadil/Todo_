import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_final/model/todomodel.dart';
import 'package:todo_final/view/widgets/custom_button.dart';

class edit extends StatefulWidget {
  const edit({super.key, required this.task, required this.desc, required this.index});

  final String task;
  final String desc;
  final int index;

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.task;
    _controller2.text = widget.desc;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("edit")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration( 
              ),
            ),
            TextFormField(
              controller: _controller2,
              decoration: InputDecoration(
              ),
            ),
            CustomButton(
              onpressed: () {
                final value=TodoModel(_controller.text, _controller2.text);
                Hive.box<TodoModel>("todoBox").putAt(widget.index, value);
                print("value updated");
                Navigator.pop(context);
              },
              text: "Update",
            ),
          ],
        ),
      ),
    );
  }
}
