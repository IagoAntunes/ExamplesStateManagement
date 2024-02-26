import 'package:testando_coisas/feat/bloc/counter_bloc/pages/counter_bloc_page.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/pages/form_bloc_page.dart';
import 'package:testando_coisas/feat/bloc/todo_bloc/page/todo_bloc_page.dart';
import 'package:testando_coisas/feat/changenotifier/counter/pages/counter_changenotifier_page.dart';
import 'package:testando_coisas/feat/changenotifier/form/page/form_changenotifier_page.dart';
import 'package:testando_coisas/feat/changenotifier/todo/page/todo_changenotifier_page.dart';
import 'package:testando_coisas/feat/cubit/counter/pages/counter_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/form/page/form_cubit_page.dart';
import 'package:testando_coisas/feat/cubit/todo/page/todo_cubit_page.dart';
import 'package:testando_coisas/feat/mobx/counter/page/counter_mobx_page.dart';
import 'package:testando_coisas/feat/mobx/form/page/form_mobx_page.dart';
import 'package:testando_coisas/feat/mobx/todo/page/todo_mobx_page.dart';
import 'package:testando_coisas/feat/signals/counter/signals_counter.dart';
import 'package:testando_coisas/feat/signals/form/signals_form.dart';

import '../models/group_page_mode.dart';
import '../models/page_model.dart';

class AppMenus {
  static List<GroupPageModel> listMenus = [
    GroupPageModel(
      title: "Bloc",
      list: [
        PageModel(page: CounterBlocPage(), title: "Counter"),
        PageModel(page: FormBlocPage(), title: "Form"),
        PageModel(page: TodoBlocPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Cubit",
      list: [
        PageModel(page: CounterCubitPage(), title: "Counter"),
        PageModel(page: FormCubitPage(), title: "Form"),
        PageModel(page: TodoCubitPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Mobx",
      list: [
        PageModel(page: CounterMobxPage(), title: "Counter"),
        PageModel(page: FormMobxPage(), title: "Form"),
        PageModel(page: TodoMobxPage(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "Signals",
      list: [
        PageModel(page: CounterSignal(), title: "Counter"),
        PageModel(page: FormSignals(), title: "Form"),
        // PageModel(page: TodoSignal(), title: "Todo"),
      ],
    ),
    GroupPageModel(
      title: "ChangeNotifier",
      list: [
        PageModel(page: CounterChangeNotifierPage(), title: "Counter"),
        PageModel(page: FormChangeNotifierPage(), title: "Form"),
        PageModel(page: TodoChangeNotifierPage(), title: "Todo"),
      ],
    ),
  ];
}
