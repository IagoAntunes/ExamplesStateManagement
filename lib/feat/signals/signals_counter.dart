import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class CounterSignal extends StatelessWidget {
  CounterSignal({super.key});

  final counter = signal(0);
  late final doubleCounter = computed(() => counter() * 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Signal Counter"),
      ),
      body: Center(
        child: Text("${doubleCounter.watch(context)}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
