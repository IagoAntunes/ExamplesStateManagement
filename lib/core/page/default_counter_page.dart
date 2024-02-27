import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/counter_buttons_actions_component.dart';
import 'package:testando_coisas/core/components/default_scaffold.dart';

class DefaultCounterPage extends StatelessWidget {
  const DefaultCounterPage({
    super.key,
    required this.title,
    required this.body,
    required this.increment,
    required this.decrement,
  });
  final String title;
  final Widget body;
  final Function() increment;
  final Function() decrement;
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Counter - $title",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: body,
      ),
      floatingActionButton: CounterButtonsAction(
        decrement: decrement,
        increment: increment,
      ),
    );
  }
}
