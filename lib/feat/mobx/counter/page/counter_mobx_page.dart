import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/counter_text_component.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';
import 'package:testando_coisas/feat/mobx/counter/store/counter_store.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterMobxPage extends StatelessWidget {
  CounterMobxPage({super.key});

  final store = CounterStore();
  final store_2 = CounterStore2();
  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      title: "Mobx",
      body: Observer(builder: (context) {
        return CounterTextComponent(data: store.count.toString());
      }),
      increment: () {
        store.increment();
      },
      decrement: () {
        store.decrement();
      },
    );
  }
}
