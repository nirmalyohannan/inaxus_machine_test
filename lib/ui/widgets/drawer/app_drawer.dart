import 'package:flutter/material.dart';
import 'package:inaxus_machine_test/providers/user_controller.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    UserController.instance.getContentCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<UserController>(
        builder: (context, userController, child) {
          if (userController.isGettingModuleList == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.person, size: 60),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userController.name ?? ""),
                      Text(
                        userController.email ?? "",
                        style: const TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                )
              ]),
              Divider(),
              ...List.generate(
                  userController.moduleList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(userController.moduleList[index]),
                      ))
            ],
          );
        },
      ),
    );
  }
}
