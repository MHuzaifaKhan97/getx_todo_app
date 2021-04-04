import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import 'package:getx_todo_app/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextField(
                  autofocus: true,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Enter What you want to accomplished.',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 999,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                ),
                RaisedButton(
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                  onPressed: () {
                    todoController.todos
                        .add(Todo(text: textEditingController.text));
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
