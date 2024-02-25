import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:testando_coisas/feat/bloc/counter_bloc/events/counter_bloc_events.dart';
import 'package:testando_coisas/feat/bloc/counter_bloc/state/counter_bloc_state.dart';

class CounterBlocPage extends StatelessWidget {
  CounterBlocPage({super.key});

  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CounterBloc, ICounterBlocState>(
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
              bloc.add(IncrementCounterBlocEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              bloc.add(DecrementCounterBlocEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
