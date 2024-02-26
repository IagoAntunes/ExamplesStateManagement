import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/default_scaffold.dart';

class DefaultFormPage extends StatelessWidget {
  const DefaultFormPage({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Form-',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: child,
      ),
    );
  }
}
