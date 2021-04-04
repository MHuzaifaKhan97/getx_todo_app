import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/models/Todo.dart';

class TodoController extends GetxController {
  // RxList<Todo> todos;
  // or
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    List storedTodos = GetStorage().read('todos');

    if (!storedTodos.isNull) {
      // todos = RxList(storedTodos.map((e) => Todo.fromJson(e)).toList());
      // or
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }

    // every time todos change, this callback is call
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
