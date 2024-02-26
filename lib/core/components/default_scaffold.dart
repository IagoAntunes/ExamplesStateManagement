import 'package:flutter/material.dart';
import 'package:testando_coisas/core/components/default_appbar.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: title,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
