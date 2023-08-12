import 'package:flutter/material.dart';
import 'package:over_time/Features/Authentication/Page/auth_page.dart';

import 'Core/Theme/app_themes.dart';
import 'Core/Dependincy Injection/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.dependincyInit();

  runApp(MaterialApp(theme: mainTheme, home: AuthPage()));
}
