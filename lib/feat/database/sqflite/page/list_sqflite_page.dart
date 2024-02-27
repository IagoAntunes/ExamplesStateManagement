import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/custom_textfield_component.dart';
import 'package:testando_coisas/core/components/default_scaffold.dart';
import 'package:testando_coisas/feat/database/sqflite/db/db_sqflite.dart';

import '../../../../core/models/todo_model.dart';

class ListSqflitePage extends StatefulWidget {
  const ListSqflitePage({super.key});

  @override
  State<ListSqflitePage> createState() => _ListSqflitePageState();
}

class _ListSqflitePageState extends State<ListSqflitePage> {
  List<TodoEntity> listTodos = [];

  Future<bool> getTodos() async {
    final list = await SqlfliteDatabase.getTodos();
    listTodos.clear();
    listTodos.addAll(list);
    print(listTodos.length);
    return true;
  }

  void createTodo(String title) async {
    await SqlfliteDatabase.createTodo(
      TodoEntity(title: title, isChecked: false, id: '0'),
    );
    setState(() {
      //
    });
  }

  void updateTodo(TodoEntity todo) async {
    await SqlfliteDatabase.updateTodo(
      todo,
    );

    setState(() {
      //
    });
  }

  void removeTodo(TodoEntity todo) async {
    listTodos.remove(todo);
    await SqlfliteDatabase.removeTodo(
      todo,
    );

    setState(() {
      //
    });
  }

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'List - Sqflite',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: titleController,
              label: 'Activitie',
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    createTodo(titleController.text);
                  }
                },
                label: const Text("Add"),
                icon: const Icon(Icons.add),
              ),
            ),
            FutureBuilder(
              future: getTodos(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: listTodos.length,
                    itemBuilder: (context, index) => Dismissible(
                      key: const Key(""),
                      onDismissed: (direction) {
                        removeTodo(listTodos[index]);
                      },
                      background: Container(
                        child: const Icon(Icons.delete),
                      ),
                      child: CheckboxListTile(
                        title: Text(
                            "${listTodos[index].title} - ${listTodos[index].id}"),
                        value: listTodos[index].isChecked,
                        onChanged: (value) {
                          listTodos[index].isChecked = value!;
                          updateTodo(listTodos[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
