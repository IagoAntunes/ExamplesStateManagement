import 'package:flutter/material.dart';

class CounterButtonsAction extends StatelessWidget {
  const CounterButtonsAction({
    super.key,
    required this.increment,
    required this.decrement,
  });
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: increment,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: decrement,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
