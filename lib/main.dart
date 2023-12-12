import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaxus_machine_test/database/db.dart';
import 'package:inaxus_machine_test/models/content_cache_model/content_cache_model.dart';
import 'package:inaxus_machine_test/providers/user_controller.dart';
import 'package:inaxus_machine_test/ui/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
void main() async {
  //::::::::::::::::::::::::::::
  await Hive.initFlutter();
  Hive.registerAdapter(ContentCacheModelAdapter());
  Db.init();
  //:::::::::::::::::::::::::::::
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
        debugShowCheckedModeBanner: false,
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
