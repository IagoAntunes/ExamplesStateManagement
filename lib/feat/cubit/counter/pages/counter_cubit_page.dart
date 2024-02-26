import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/cubit/counter/bloc/counter_cubit.dart';
import 'package:testando_coisas/feat/cubit/counter/state/counter_cubit_state.dart';

class CounterCubitPage extends StatelessWidget {
  CounterCubitPage({super.key});

  final bloc = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CounterCubit, ICounterCubitState>(
          bloc: bloc,
          builder: (context, state) {
            return Center(
              child: Text(
                state.count.toString(),
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              bloc.decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
