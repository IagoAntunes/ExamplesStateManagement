import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testando_coisas/feat/riverpod/todo/controller/todo_riverpod_controller.dart';
import 'package:testando_coisas/feat/riverpod/todo/state/todo_riverpod_state.dart';

import '../../../../core/components/todo_add_button_component.dart';
import '../../../../core/page/default_todo_page.dart';

class TodoRiverpodPage extends ConsumerWidget {
  const TodoRiverpodPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTodoPage(
      title: 'Riverpod',
      body: Column(
        children: [
          TextField(
            enabled: ref.watch(todoRiverpodProvider).value
                is! LoadingTodoRiverpodState,
            onChanged: (value) {
              ref.read(todoRiverpodProvider).filterItems(value);
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
          switch (ref.watch(todoRiverpodProvider).value) {
            LoadingTodoRiverpodState() =>
              const Center(child: CircularProgressIndicator()),
            SuccessTodoRiverpodState() => Expanded(
                child: ListView.builder(
                  itemCount: ref.read(todoRiverpodProvider).filterTodos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: CheckboxListTile(
                        onChanged: (value) {
                          if (value != null) {
                            ref.read(todoRiverpodProvider).selectItem(
                                  ref
                                      .read(todoRiverpodProvider)
                                      .filterTodos[index],
                                  value,
                                );
                          }
                        },
                        value: ref
                            .watch(todoRiverpodProvider)
                            .filterTodos[index]
                            .isChecked,
                        title: Text(ref
                            .read(todoRiverpodProvider)
                            .filterTodos[index]
                            .title),
                      ),
                    );
                  },
                ),
              ),
            FailureTodoRiverpodState() => const Text("Ola"),
            _ => Container(),
          },
        ],
      ),
      floatingActionButton: TodoButtonAdd(
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return IntrinsicHeight(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            ref
                                .read(todoRiverpodProvider)
                                .addTodo(titleController.text);
                            Navigator.pop(context);
                          },
                          label: const Text("Adicionar"),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
