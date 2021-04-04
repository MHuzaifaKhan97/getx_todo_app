import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import 'package:getx_todo_app/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.orange,
      //   backgroundColor: Colors.orange,
      //   title: Text(
      //     'GetX Todo List',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: width * 0.02, top: height * 0.06),
            width: width,
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Task Management'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: width,
              height: height * 0.8,
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (_) {
                      var removed = todoController.todos[index];
                      todoController.todos.removeAt(index);
                      Get.snackbar('Task Removed',
                          'Task ${removed.text} has been removed successfully',
                          mainButton: FlatButton(
                              onPressed: () {
                                if (removed.isNull) {
                                  return;
                                }
                                todoController.todos.insert(index, removed);
                                removed = null;
                                if (Get.isSnackbarOpen) {
                                  Get.back();
                                }
                              },
                              child: Text('Undo')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: todoController.todos[index].done
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: todoController.todos[index].done
                            ? Border.all(color: Colors.red, width: 2)
                            : Border.all(color: Colors.blue, width: 2),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                        title: Text(
                          todoController.todos[index].text,
                          style: todoController.todos[index].done
                              ? TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 18,
                                )
                              : TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                        ),
                        onTap: () {
                          Get.to(TodoScreen(index: index));
                        },
                        leading: Checkbox(
                          checkColor: Colors.blue,
                          activeColor: Colors.white,
                          value: todoController.todos[index].done,
                          onChanged: (v) {
                            var changed = todoController.todos[index];
                            changed.done = v;
                            todoController.todos[index] = changed;
                          },
                        ),
                        trailing: Icon(Icons.chevron_right,
                            color: todoController.todos[index].done
                                ? Colors.white
                                : Colors.blue),
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: todoController.todos.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
