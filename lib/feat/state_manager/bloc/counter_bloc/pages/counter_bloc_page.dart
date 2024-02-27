import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';
import 'package:testando_coisas/feat/state_manager/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:testando_coisas/feat/state_manager/bloc/counter_bloc/events/counter_bloc_events.dart';
import 'package:testando_coisas/feat/state_manager/bloc/counter_bloc/state/counter_bloc_state.dart';

class CounterBlocPage extends StatelessWidget {
  CounterBlocPage({super.key});

  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      title: "Bloc",
      body: BlocBuilder<CounterBloc, ICounterBlocState>(
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
      increment: () {
        bloc.add(IncrementCounterBlocEvent());
      },
      decrement: () {
        bloc.add(DecrementCounterBlocEvent());
      },
    );
  }
}
