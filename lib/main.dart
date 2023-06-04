import 'package:flutter/material.dart';
import 'package:keytool_app/modules/home/view/home_screen.dart';
import 'package:keytool_app/theme/app_theme.dart';

import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    title: "Android Keygen",
    size:  Size(500, 700),
    center: true,
    maximumSize: Size(500, 700)
  );
  windowManager.waitUntilReadyToShow(windowOptions,() async {
    await windowManager.show();
    await windowManager.focus();
  },);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().setTheme(),
      home: const HomeScreen()
    );
  }
}


