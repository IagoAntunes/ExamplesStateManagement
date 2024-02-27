import 'package:flutter/material.dart';
import 'package:testando_coisas/core/menus/all_menus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Managements"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: AppMenus.listMenus.length,
          itemBuilder: (context, index) {
            var menu = AppMenus.listMenus[index];
            return Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 4),
                    child: Text(
                      menu.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  for (var item in menu.list)
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item.builder(),
                          ),
                        );
                      },
                      title: Text(item.title),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
