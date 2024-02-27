import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testando_coisas/core/components/counter_text_component.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';

import '../controller/counter_riverpod_controller.dart';

class CounterRiverpodPage extends ConsumerWidget {
  const CounterRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultCounterPage(
      title: 'Riverpod',
      body: CounterTextComponent(
          data: ref.watch(counterRiverpodProvider).value.toString()),
      increment: () {
        ref.read(counterRiverpodProvider.notifier).increment();
      },
      decrement: () {
        ref.read(counterRiverpodProvider.notifier).decrement();
      },
    );
  }
}
