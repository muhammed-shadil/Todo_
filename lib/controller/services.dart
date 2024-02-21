import 'package:hive/hive.dart';
import 'package:todo_final/model/todomodel.dart';

class Services {
  final String _boxName = "todoBox";

  Future<Box<TodoModel>> get _box async =>
      await Hive.openBox<TodoModel>(_boxName);

  Future<void> addTodo(TodoModel item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<TodoModel>> getAllTodo() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteTodo(TodoModel item, int index) async {
    var box = await _box;
    await box.deleteAt(index);

    await Hive.box<TodoModel>('deletedTodoBox').add(item);
  }

  Future<void> updateIsCompleted(TodoModel item, int index) async {
    var box = await _box;
    item.isComplete = !item.isComplete;
    await box.putAt(index, item);
  }

  Future<void> restoreTodoFromDeleted(TodoModel item, int index) async {
    await Hive.box<TodoModel>('deletedTodoBox').deleteAt(index);
    await Hive.box<TodoModel>('todoBox').add(item);
  }

  Future<void> deleteTodoFromDeleted(int index) async {
    var deletedBox = await Hive.openBox<TodoModel>('deletedTodoBox');
    await deletedBox.deleteAt(index);
  }
}
