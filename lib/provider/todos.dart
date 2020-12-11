import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Đánh răng rửa mặt 😋',
      description: '07:00 - 02/12/2020',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Đá bóng',
      description: '07:00 - 02/12/2020',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Dog 🐕',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Chúc mừng sinh nhật 🎉',
      description:'07:00 - 02/12/2020',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
