import 'package:flutter/material.dart';
import 'package:testando_coisas/feat/bloc/todo_bloc/page/todo_bloc_page.dart';
import 'package:testando_coisas/feat/cubit/counter/pages/counter_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/form/page/form_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/todo/page/todo_cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: TodoCubitPage(),
    );
  }
}
