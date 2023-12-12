import 'package:flutter/material.dart';
import 'package:inaxus_machine_test/providers/user_controller.dart';
import 'package:inaxus_machine_test/ui/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController.instance)
      ],
      child: MaterialApp(
        title: 'Inaxus Machine Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
