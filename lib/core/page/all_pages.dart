import 'package:flutter/material.dart';
import 'package:testando_coisas/core/menus/all_menus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menus"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: AppMenus.listSections.length,
          itemBuilder: (context, index) {
            var menu = AppMenus.listSections[index];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => menu.builder(),
                        ),
                      );
                    },
                    title: Text(menu.title),
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
