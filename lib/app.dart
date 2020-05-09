import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'configs/colors.dart';
import 'di/injection.dart';
import 'env/env.dart';
import 'routes.dart';
import 'core/extensions.dart';

void run(Env env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initWithEnviroment(env);

  await configureInjection(env);

  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'CircularStd',
        textTheme: theme.textTheme.apply(
          fontFamily: 'CircularStd',
          displayColor: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.lightGrey,
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.instance().navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
    );
  }
}
