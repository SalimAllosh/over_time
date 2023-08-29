import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ColorScheme darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: onPrimaryColor,
  secondary: secondaryColor,
  onSecondary: onSecondaryColor,
  error: errorColor,
  onError: onErrorColor,
  background: backgroundColor,
  onBackground: onBackgroundColor,
  surface: surfaceColor,
  onSurface: onSurfaceColor,
);

Color primaryColor = const Color(0xFFFB8D00);
Color onPrimaryColor = Color.fromARGB(255, 45, 45, 45);
Color secondaryColor = const Color(0xFFFB8D00);
Color onSecondaryColor = const Color(0xFF000000);
Color errorColor = const Color(0xFFB00020);
Color onErrorColor = const Color(0xFFFFFFFF);
Color backgroundColor = const Color(0xFFFEFEFE);
Color onBackgroundColor = const Color(0xFF000000);
Color surfaceColor = const Color(0xFF000000);
Color onSurfaceColor = const Color(0xFFFFFFFF);
Color background2Color = Color.fromARGB(185, 255, 145, 0);
