import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_final/controller/services.dart';
import 'package:todo_final/view/homepage.dart';
import 'package:todo_final/view/widgets/delete.dart';
import 'package:todo_final/view/widgets/profile.dart';
import 'package:todo_final/view/widgets/settings.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({super.key});

  final Services _todoService = Services();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(() =>const HomePage());
              },
              child: const ListTile(
                title: Text("My Tasks"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=>delete(todoService: _todoService));
              },
              child: const ListTile(
                title: Text("Deleted tasks"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() =>const settingsPage(),transition: Transition.fadeIn);
              },
              child:const ListTile(
                title: Text("Settings"),
              ),
            ),
            GestureDetector(onTap: () {
                Get.to(() =>const profile(),transition: Transition.zoom);
         
            },
              child:const ListTile(
                title: Text("profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
