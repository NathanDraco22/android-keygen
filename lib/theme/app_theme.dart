


import 'package:flutter/material.dart';

class AppTheme {

  final ColorScheme flexSchemeDark = const ColorScheme(
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



  ThemeData setTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: flexSchemeDark
      );





}


