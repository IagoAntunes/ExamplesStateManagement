import 'package:testando_coisas/feat/bloc/counter_bloc/pages/counter_bloc_page.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/pages/form_bloc_page.dart';
import 'package:testando_coisas/feat/bloc/todo_bloc/page/todo_bloc_page.dart';
import 'package:testando_coisas/feat/changenotifier/counter/pages/counter_changenotifier_page.dart';
import 'package:testando_coisas/feat/changenotifier/form/page/form_changenotifier_page.dart';
import 'package:testando_coisas/feat/changenotifier/todo/page/todo_changenotifier_page.dart';
import 'package:testando_coisas/feat/cubit/counter/pages/counter_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/form/page/form_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/todo/page/todo_cubit_page.dart';
import 'package:testando_coisas/feat/getx/counter/page/counter_getx_page.dart';
import 'package:testando_coisas/feat/getx/form/page/form_getx_page.dart';
import 'package:testando_coisas/feat/getx/todo/page/todo_getx_page.dart';
import 'package:testando_coisas/feat/mobx/counter/page/counter_mobx_page.dart';
import 'package:testando_coisas/feat/mobx/form/page/form_mobx_page.dart';
import 'package:testando_coisas/feat/mobx/todo/page/todo_mobx_page.dart';
import 'package:testando_coisas/feat/riverpod/counter/page/counter_riverpod_page.dart';
import 'package:testando_coisas/feat/riverpod/form/page/form_riverpod_page.dart';
import 'package:testando_coisas/feat/riverpod/todo/page/todo_riverpod_page.dart';
import 'package:testando_coisas/feat/signals/counter/signals_counter.dart';
import 'package:testando_coisas/feat/signals/form/signals_form.dart';

import '../models/group_page_mode.dart';
import '../models/page_model.dart';

class AppMenus {
  static List<GroupPageModel> listMenus = [
    GroupPageModel(
      title: "Bloc",
      list: [
        PageModel(builder: () => CounterBlocPage(), title: "Counter"),
        PageModel(builder: () => FormBlocPage(), title: "Form"),
        PageModel(builder: () => TodoBlocPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Cubit",
      list: [
        PageModel(builder: () => CounterCubitPage(), title: "Counter"),
        PageModel(builder: () => FormCubitPage(), title: "Form"),
        PageModel(builder: () => TodoCubitPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Mobx",
      list: [
        PageModel(builder: () => CounterMobxPage(), title: "Counter"),
        PageModel(builder: () => FormMobxPage(), title: "Form"),
        PageModel(builder: () => TodoMobxPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Signals",
      list: [
        PageModel(builder: () => CounterSignal(), title: "Counter"),
        PageModel(builder: () => FormSignals(), title: "Form"),
        // PageModel(builder:() =>  TodoSignal(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "ChangeNotifier",
      list: [
        PageModel(builder: () => CounterChangeNotifierPage(), title: "Counter"),
        PageModel(builder: () => FormChangeNotifierPage(), title: "Form"),
        PageModel(builder: () => TodoChangeNotifierPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "GetX",
      list: [
        PageModel(builder: () => CounterGetxPage(), title: "Counter"),
        PageModel(builder: () => FormGetxPage(), title: "Form"),
        PageModel(builder: () => TodoGetxPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Riverpod",
      list: [
        PageModel(builder: () => const CounterRiverpodPage(), title: "Counter"),
        PageModel(builder: () => FormRiverpodPage(), title: "Form"),
        PageModel(builder: () => TodoRiverpodPage(), title: "Todo"),
      ],
    ),
  ];
}
