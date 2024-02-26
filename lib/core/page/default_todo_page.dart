import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/default_scaffold.dart';

class DefaultTodoPage extends StatelessWidget {
  const DefaultTodoPage({
    super.key,
    required this.floatingActionButton,
    required this.body,
  });
  final Widget body;
  final Widget floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Todo- ',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
