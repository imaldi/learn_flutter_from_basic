import 'package:hive/hive.dart';
import 'package:learn_flutter_from_basic/model/to_do.dart';

class TodoService {
  late Box<ToDo> _tasks;

  Future<void> init() async {
    Hive.registerAdapter(ToDoAdapter());
    _tasks = await Hive.openBox<ToDo>('tasks');

    // await _tasks.clear();
    //
    // await _tasks.add(Task('testuser1', 'Subscribe to Flutter From Scratch', true));
    // await _tasks.add(Task('flutterfromscratch', 'Comment on the video', false));
  }

  /// Create Task
  void addTask(final String task, final String username) {
    _tasks.add(ToDo(task, username));
  }

  /// Read Task
  List<ToDo> getTasks(final String username) {
    final task = _tasks.values.where((element) => element.username == username);
    return task.toList();
  }

  /// Update Task
  Future<void> updateTask(final String task, final String username) async {
    final taskToEdit = _tasks.values.firstWhere((element) => element.task == task && element.username == username);
    final index = taskToEdit.key as int;
    await _tasks.put(index, ToDo(username, task, isDone: false));
  }

  /// Delete Task
  Future<void> removeTask(final String task, final String username) async {
    final taskToRemove = _tasks.values.firstWhere((element) => element.task == task && element.username == username);
    await taskToRemove.delete();
  }
}