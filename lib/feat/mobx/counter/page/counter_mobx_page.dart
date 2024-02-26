import 'package:flutter/material.dart';
import 'package:testando_coisas/feat/mobx/counter/store/counter_store.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterMobxPage extends StatelessWidget {
  CounterMobxPage({super.key});

  final store = CounterStore();
  final store_2 = CounterStore2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COUNTER MOBX"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Observer(builder: (context) {
          return Center(
            child: Text(
              store_2.count.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              store_2.increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              store_2.decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
