import 'package:hive/hive.dart';
part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  bool isComplete;

  TodoModel(this.title, {this.isComplete = false});
}
