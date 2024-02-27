import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/model/todomodel.dart';
import 'package:todo_final/view/homepage.dart';
import 'package:todo_final/view/widgets/apptheme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox('settings');
  await Hive.openBox<TodoModel>('deletedTodoBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Services _todoService = Services();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark', defaultValue: false);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          home: FutureBuilder(
              future: _todoService.getAllTodo(),
              builder: (BuildContext context,
                      AsyncSnapshot<List<TodoModel>> snapshot) =>
                  (snapshot.connectionState == ConnectionState.done)
                      ? const HomePage()
                      : const CircularProgressIndicator()),
        );
      },
    );
  }
}
