import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testando_coisas/core/page/default_counter_page.dart';
import 'package:testando_coisas/feat/state_manager/getx/counter/controller/counter_getx_controller.dart';

class CounterGetxPage extends StatelessWidget {
  CounterGetxPage({super.key});

  final controller = Get.put(CounterGetxController());

  @override
  Widget build(BuildContext context) {
    return DefaultCounterPage(
      title: 'GetX',
      body: Center(
        child: Obx(
          () => Text(controller.count.toString()),
        ),
      ),
      increment: () {
        controller.increment();
      },
      decrement: () {
        controller.decrement();
      },
    );
  }
}
