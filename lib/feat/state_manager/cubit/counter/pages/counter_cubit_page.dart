import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/state_manager/cubit/counter/bloc/counter_cubit.dart';
import 'package:testando_coisas/feat/state_manager/cubit/counter/state/counter_cubit_state.dart';

import '../../../../../core/components/counter_text_component.dart';
import '../../../../../core/page/default_counter_page.dart';

class CounterCubitPage extends StatelessWidget {
  CounterCubitPage({super.key});

  final bloc = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      title: 'Cubit',
      body: BlocBuilder<CounterCubit, ICounterCubitState>(
        bloc: bloc,
        builder: (context, state) {
          return CounterTextComponent(
            data: bloc.state.count.toString(),
          );
        },
      ),
      increment: () {
        bloc.increment();
      },
      decrement: () {
        bloc.decrement();
      },
    );
  }
}
