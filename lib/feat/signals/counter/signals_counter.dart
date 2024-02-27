import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';

class CounterSignal extends StatelessWidget {
  CounterSignal({super.key});

  final counter = signal(0);
  late final doubleCounter = computed(() => counter() * 2);

  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      title: 'Signals',
      body: Center(
        child: Text("${doubleCounter.watch(context)}"),
      ),
      increment: () {
        counter.value++;
      },
      decrement: () {
        counter.value--;
      },
    );
  }
}
