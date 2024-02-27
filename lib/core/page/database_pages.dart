import 'package:flutter/material.dart';
import 'package:testando_coisas/core/menus/all_menus.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  @override
  void initState() {
    super.initState();
    createTablesSqflite();
  }

  void createTablesSqflite() {}

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
          itemCount: AppMenus.listDatabase.length,
          itemBuilder: (context, index) {
            var menu = AppMenus.listDatabase[index];
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
