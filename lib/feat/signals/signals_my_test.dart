import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/states/base_state.dart';

class _TodoSignalModel {
  final String title;
  bool isCompleted;
  _TodoSignalModel({
    required this.title,
    this.isCompleted = false,
  });
}

class _TodoSignalController {
  _TodoSignalController() {
    getTodos();
  }
  var state = signal<IState>(IdleState());

  List<_TodoSignalModel> listTodo = [];

  var list = listSignal([
    signal(_TodoSignalModel(title: "title")),
  ]);
  late final filterTodo = computed(
    () {
      print("Entrou filter");
      var list = listTodo
          .where(
            (element) => element.title.toLowerCase().contains(
                  searchController.value.toLowerCase(),
                ),
          )
          .toList();
      for (var item in list) {
        print("Todo-> ${item.title} -> ${item.isCompleted}");
      }
      return list;
    },
  );

  late final searchEnabled = computed(() => state.value is! LoadingState);

  var searchController = signal("");

  void getTodos() async {
    state.value = LoadingState();
    await Future.delayed(Duration(seconds: 3));
    listTodo.addAll([
      _TodoSignalModel(title: "Academia"),
      _TodoSignalModel(title: "Estudar"),
      _TodoSignalModel(title: "Futebol"),
    ]);
    state.value = SuccessState();
  }
}

class TodoSignal extends StatelessWidget {
  TodoSignal({super.key});
  final controller = _TodoSignalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signal Todo")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            TextField(
              enabled: controller.searchEnabled.watch(context),
              onChanged: (value) {
                controller.searchController.value = value;
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
            switch (controller.state.watch(context)) {
              LoadingState() => Center(child: CircularProgressIndicator()),
              SuccessState() => _SuccessWidget(controller: controller),
              FailureState() => Text("Ola"),
              _ => Container(),
            },
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({
    required this.controller,
  });
  final _TodoSignalController controller;
  @override
  Widget build(BuildContext context) {
    return Watch.builder(builder: (context) {
      print("WATCH BUILDER");
      return Expanded(
        child: ListView.builder(
          itemCount: controller.filterTodo.value.length,
          itemBuilder: (context, index) {
            print("Ola");
            return Card(
              child: CheckboxListTile(
                onChanged: (value) {
                  if (value != null) {
                    print("MUDOU");
                    controller.filterTodo.value[index].isCompleted = true;
                    var aux = controller.listTodo
                        .where(
                          (element) =>
                              element.title ==
                              controller.filterTodo.value[index].title,
                        )
                        .first;
                    print(aux.title);
                    aux.isCompleted = true;
                    controller.filterTodo.recompute();
                  }
                },
                value: controller.filterTodo.value[index].isCompleted,
                title: Text(controller.filterTodo.value[index].title),
              ),
            );
          },
        ),
      );
    });
  }
}
