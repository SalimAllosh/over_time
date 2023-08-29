import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:over_time/Core/Route/app_routes.dart';
import 'package:over_time/Features/Authentication/blocs/bio_auth_cubit.dart';

import 'Core/Theme/app_themes.dart';
import 'Core/Dependincy Injection/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.dependincyInit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BioAuthCubit>(
          create: (context) => BioAuthCubit(),
        ),
      ],
      child: MaterialApp(
        theme: mainTheme,
        initialRoute: AppRoutes.authPageName,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
