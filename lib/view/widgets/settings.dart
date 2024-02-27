import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class settingSpage extends StatefulWidget {
  const settingSpage({super.key});

  @override
  State<settingSpage> createState() => _settingSpageState();
}

class _settingSpageState extends State<settingSpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Theme",style: TextStyle(fontSize: 25),),
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
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
