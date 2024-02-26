import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testando_coisas/feat/mobx/todo/state/todo_mobx_state.dart';
import 'package:testando_coisas/feat/mobx/todo/store/todo_mobx_store.store.dart';

class TodoMobxPage extends StatelessWidget {
  TodoMobxPage({super.key});
  final store = TodoMobxStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signal Todo")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Observer(builder: (context) {
          return Column(
            children: [
              TextField(
                enabled: store.state is! LoadingTodoMobxMobxState,
                onChanged: (value) {
                  store.filterItems(value);
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
              switch (store.state) {
                LoadingTodoMobxMobxState() =>
                  const Center(child: CircularProgressIndicator()),
                SuccessTodoMobxMobxState() => Expanded(
                    child: ListView.builder(
                      itemCount: store.listFilterTodos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: CheckboxListTile(
                            onChanged: (value) {
                              if (value != null) {
                                store.selectItem(
                                    store.listFilterTodos[index], value);
                              }
                            },
                            value: store.listFilterTodos[index].isChecked,
                            title: Text(store.listFilterTodos[index].title),
                          ),
                        );
                      },
                    ),
                  ),
                FailureTodoMobxMobxState() => const Text("Ola"),
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
                        store.addTodo(titleController.text);
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
