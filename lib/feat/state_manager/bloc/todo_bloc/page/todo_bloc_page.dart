import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/page/default_todo_page.dart';
import 'package:testando_coisas/feat/state_manager/bloc/todo_bloc/bloc/todo_bloc.dart';
import 'package:testando_coisas/feat/state_manager/bloc/todo_bloc/state/todo_bloc_state.dart';

import '../../../../../core/states/base_state.dart';
import '../event/todo_bloc_event.dart';

class TodoBlocPage extends StatelessWidget {
  TodoBlocPage({super.key});
  final bloc = TodoBloc();
  @override
  Widget build(BuildContext context) {
    return DefaultTodoPage(
      title: 'Bloc',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            TextField(
              enabled: bloc.state
                  is! LoadingGetTodoBlocState, // Habilita ou desabilita o TextField com base no estado
              onChanged: (value) {
                bloc.add(FilterTodoBlocEvent(text: value));
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
            BlocBuilder<TodoBloc, ITodoBlocState>(
                bloc: bloc,
                buildWhen: (previous, current) {
                  if (current is IGetedTodoBlocState) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  return switch (state) {
                    LoadingGetTodoBlocState() =>
                      const Center(child: CircularProgressIndicator()),
                    SuccessGetTodoBlocState() => Expanded(
                        child: ListView.builder(
                          itemCount: state.listTodos.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: CheckboxListTile(
                                onChanged: (value) {
                                  if (value != null) {
                                    bloc.add(
                                      CheckTodoBlocEvent(
                                        todo: state.listTodos[index],
                                        value: value,
                                      ),
                                    );
                                  }
                                },
                                value: state.listTodos[index].isChecked,
                                title: Text(state.listTodos[index].title),
                              ),
                            );
                          },
                        ),
                      ),
                    FailureState() => const Text("Ola"),
                    _ => Container(),
                  };
                }),
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
                        bloc.add(AddTodoBlocEvent(title: titleController.text));
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
