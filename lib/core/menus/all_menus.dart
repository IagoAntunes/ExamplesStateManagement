import 'package:testando_coisas/core/models/section_model.dart';
import 'package:testando_coisas/core/page/state_manager_pages.dart';
import 'package:testando_coisas/feat/database/sqflite/page/list_sqflite_page.dart';
import 'package:testando_coisas/feat/state_manager/bloc/counter_bloc/pages/counter_bloc_page.dart';
import 'package:testando_coisas/feat/state_manager/bloc/form_bloc/pages/form_bloc_page.dart';
import 'package:testando_coisas/feat/state_manager/bloc/todo_bloc/page/todo_bloc_page.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/counter/pages/counter_changenotifier_page.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/form/page/form_changenotifier_page.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/todo/page/todo_changenotifier_page.dart';
import 'package:testando_coisas/feat/state_manager/cubit/counter/pages/counter_cubit_page.dart';
import 'package:testando_coisas/feat/state_manager/cubit/form/page/form_cubit_page.dart';
import 'package:testando_coisas/feat/state_manager/cubit/todo/page/todo_cubit_page.dart';
import 'package:testando_coisas/feat/state_manager/getx/counter/page/counter_getx_page.dart';
import 'package:testando_coisas/feat/state_manager/getx/form/page/form_getx_page.dart';
import 'package:testando_coisas/feat/state_manager/getx/todo/page/todo_getx_page.dart';
import 'package:testando_coisas/feat/state_manager/mobx/counter/page/counter_mobx_page.dart';
import 'package:testando_coisas/feat/state_manager/mobx/form/page/form_mobx_page.dart';
import 'package:testando_coisas/feat/state_manager/mobx/todo/page/todo_mobx_page.dart';
import 'package:testando_coisas/feat/state_manager/riverpod/counter/page/counter_riverpod_page.dart';
import 'package:testando_coisas/feat/state_manager/riverpod/form/page/form_riverpod_page.dart';
import 'package:testando_coisas/feat/state_manager/riverpod/todo/page/todo_riverpod_page.dart';
import 'package:testando_coisas/feat/state_manager/signals/counter/signals_counter.dart';
import 'package:testando_coisas/feat/state_manager/signals/form/signals_form.dart';

import '../models/group_page_mode.dart';
import '../models/page_model.dart';
import '../page/database_pages.dart';

class AppMenus {
  static List<SectionModel> listSections = [
    SectionModel(
      title: 'State Manager',
      list: listMenus,
      builder: () => const StateManagerPage(),
    ),
    SectionModel(
      title: 'Database',
      list: listDatabase,
      builder: () => const DatabasePage(),
    ),
  ];
  static List<GroupPageModel> listDatabase = [
    GroupPageModel(
      title: "Sqflite",
      list: [
        PageModel(builder: () => const ListSqflitePage(), title: "List Todos"),
      ],
    ),
  ];
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
        PageModel(builder: () => const TodoRiverpodPage(), title: "Todo"),
      ],
    ),
  ];
}
