import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/view/android_keygen_screen.dart';


import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
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
      // theme: theme,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: flexSchemeDark
      ),
      home: const AndroidKeygenScreen()
    );
  }
}

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff53dbca),
  onPrimary: Color(0xff040807),
  primaryContainer: Color(0xff005048),
  onPrimaryContainer: Color(0xfff2f7f7),
  secondary: Color(0xffaeccce),
  onSecondary: Color(0xff070808),
  secondaryContainer: Color(0xff304b4d),
  onSecondaryContainer: Color(0xfff5f7f7),
  tertiary: Color(0xffc0c3ef),
  onTertiary: Color(0xff070708),
  tertiaryContainer: Color(0xff404468),
  onTertiaryContainer: Color(0xfff6f6f9),
  error: Color(0xffffb4ab),
  onError: Color(0xff080706),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xfffbf2f3),
  background: Color(0xff131918),
  onBackground: Color(0xfff3f4f4),
  surface: Color(0xff131716),
  onSurface: Color(0xfff7f7f7),
  surfaceVariant: Color(0xff343c3b),
  onSurfaceVariant: Color(0xfff2f2f2),
  outline: Color(0xff7b8686),
  outlineVariant: Color(0xff323737),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfff9fdfd),
  onInverseSurface: Color(0xff070707),
  inversePrimary: Color(0xff316a63),
  surfaceTint: Color(0xff53dbca),
);
