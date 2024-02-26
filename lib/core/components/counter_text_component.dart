import 'package:flutter/material.dart';

class CounterTextComponent extends StatelessWidget {
  const CounterTextComponent({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
