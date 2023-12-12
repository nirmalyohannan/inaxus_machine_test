import 'package:flutter/material.dart';
import 'package:inaxus_machine_test/main.dart';
import 'package:inaxus_machine_test/ui/widgets/drawer/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('Home Screen'),
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        body: const SafeArea(
          child: Center(
            child: Text('Home Screen'),
          ),
        ));
  }
}
