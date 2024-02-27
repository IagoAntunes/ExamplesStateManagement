import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:testando_coisas/core/page/default_todo_page.dart';
import 'package:testando_coisas/feat/state_manager/getx/todo/controller/todo_getx_controller.dart';
import 'package:testando_coisas/feat/state_manager/getx/todo/state/todo_getx_state.dart';

class TodoGetxPage extends StatelessWidget {
  TodoGetxPage({super.key});
  final controller = TodoGetxController();
  @override
  Widget build(BuildContext context) {
    return DefaultTodoPage(
      title: 'GetX',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Obx(
              () => TextField(
                enabled: controller.state.value is! LoadingTodoGetxState,
                onChanged: (value) {
                  controller.filterItems(value);
                },
                decoration: InputDecoration(
                  hintText: "Filtre uma tarefa",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => switch (controller.state.value) {
                LoadingTodoGetxState() =>
                  const Center(child: CircularProgressIndicator()),
                SuccessTodoGetxState() => Expanded(
                    child: ListView.builder(
                      itemCount: controller.filterTodos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: CheckboxListTile(
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectItem(
                                    controller.filterTodos[index], value);
                              }
                            },
                            value: controller.filterTodos[index].isChecked,
                            title: Text(controller.filterTodos[index].title),
                          ),
                        );
                      },
                    ),
                  ),
                FalureTodoGetxState() => const Text("Ola"),
                _ => Container(),
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          showModalBottomSheet(
            context: context,
            builder: (context) => IntrinsicHeight(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  const Text(
                    "Nova Atividade",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: titleController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Titulo da Atividade",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.addTodo(titleController.text);
                        Navigator.pop(context);
                      },
                      label: const Text("Adicionar"),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            )),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
