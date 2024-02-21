import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/view/widgets/delete.dart';
import 'package:todo_final/view/widgets/floating_button.dart';
import 'package:todo_final/view/widgets/taskpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;

  final Services _todoService = Services();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List pages = [
      taskpage(todoService: _todoService),
      delete(
        todoService: _todoService,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO"),
        actions: [
          ValueListenableBuilder(
            valueListenable: Hive.box('settings').listenable(),
            builder: (context, box, child) {
              final isDark = box.get('isDark', defaultValue: false);
              return Switch(
                value: isDark,
                onChanged: (val) {
                  box.put("isDark", val);
                },
              );
            },
          )
        ],
      ),
      floatingActionButton:
          FloatingButton(controller: _controller, todoService: _todoService),
      body: pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: _currentindex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.delete_outline), label: "delete")
        ],
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
