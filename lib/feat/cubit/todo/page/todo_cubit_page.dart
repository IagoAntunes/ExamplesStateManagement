import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/cubit/todo/bloc/todo_cubit.dart';
import 'package:testando_coisas/feat/cubit/todo/state/todo_cubit_state.dart';

class TodoCubitPage extends StatelessWidget {
  TodoCubitPage({super.key});
  final cubit = TodoCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signal Todo")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: BlocBuilder<TodoCubit, ITodoCubitState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  enabled: cubit.state is! LoadingTodoCubitState,
                  onChanged: (value) {
                    cubit.filterItems(value);
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
                switch (state) {
                  LoadingTodoCubitState() =>
                    const Center(child: CircularProgressIndicator()),
                  LoadedTodoCubitState() => Expanded(
                      child: ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: CheckboxListTile(
                              onChanged: (value) {
                                if (value != null) {
                                  cubit.selectItem(state.list[index], value);
                                }
                              },
                              value: state.list[index].isChecked,
                              title: Text(state.list[index].title),
                            ),
                          );
                        },
                      ),
                    ),
                  FailureTodoCubitState() => const Text("Ola"),
                  _ => Container(),
                },
              ],
            );
          },
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
                        cubit.addTodo(titleController.text);
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
