import 'package:flutter/material.dart';

class TodoButtonAdd extends StatelessWidget {
  const TodoButtonAdd({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
