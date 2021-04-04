import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/models/Todo.dart';

class TodoController extends GetxController {
  // RxList<Todo> todos;
  // or
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    // every time todos change, this callback is call
    ever(todos, (_) {
      GetStorage.write('todos', todos.toList());
    });
    super.onInit();
  }
}
