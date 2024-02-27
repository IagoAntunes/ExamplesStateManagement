import 'package:flutter/material.dart';
import 'package:testando_coisas/core/page/default_todo_page.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/todo/controller/todo_changenotifier_controller.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/todo/state/todo_changenotifier_state.dart';

class TodoChangeNotifierPage extends StatelessWidget {
  TodoChangeNotifierPage({super.key});
  final controller = TodoChangeNotifierController();
  @override
  Widget build(BuildContext context) {
    return DefaultTodoPage(
      title: 'ChangeNotifier',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              return Column(
                children: [
                  TextField(
                    enabled:
                        controller.state is! LoadingTodoChangeNotifierState,
                    onChanged: (value) {
                      controller.filterTodos(value);
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
                  const SizedBox(height: 16),
                  switch (controller.state) {
                    LoadingTodoChangeNotifierState() =>
                      const Center(child: CircularProgressIndicator()),
                    SuccessTodoChangeNotifierState() => Expanded(
                        child: ListView.builder(
                          itemCount: controller.filterList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: CheckboxListTile(
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectItem(
                                        controller.filterList[index], value);
                                  }
                                },
                                value: controller.filterList[index].isChecked,
                                title: Text(controller.filterList[index].title),
                              ),
                            );
                          },
                        ),
                      ),
                    FailureTodoChangeNotifierState() => const Text("Ola"),
                    _ => Container(),
                  },
                ],
              );
            }),
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
