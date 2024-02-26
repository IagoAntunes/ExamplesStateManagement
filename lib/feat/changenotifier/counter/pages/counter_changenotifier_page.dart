import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/counter_text_component.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';
import 'package:testando_coisas/feat/changenotifier/counter/controller/counter_changenotifier_controller.dart';

class CounterChangeNotifierPage extends StatelessWidget {
  CounterChangeNotifierPage({super.key});
  final controller = CounterChangeNotifierController();
  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      //ListenableBuilder is the widget responsible for listening to notifications issued by "[ChangeNotifier]"
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return CounterTextComponent(
            data: controller.count.toString(),
          );
        },
      ),
      increment: () {
        controller.increment();
      },
      decrement: () {
        controller.decrement();
      },
    );
  }
}
