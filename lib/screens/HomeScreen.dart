import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(title: Text('GetX Todo List')),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                todoController.todos[index].text,
                style: todoController.todos[index].done
                    ? TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough)
                    : TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length,
          ),
        ),
      ),
    );
  }
}
