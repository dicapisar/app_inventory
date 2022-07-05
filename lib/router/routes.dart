import 'package:flutter/material.dart';

import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/screens/screens.dart';

class Routes {
  static const initialRoute = 'login';

  static final routes = <ScreenRoute>[
    ScreenRoute(route: 'login', name: 'Login', screen: const LoginScreen()),
    ScreenRoute(
        route: 'forgotPassword',
        name: 'Login Password',
        screen: const ForgotPasswordScreen()),
    ScreenRoute(route: 'list', name: 'List', screen: const ListScreen()),
    ScreenRoute(route: 'form', name: 'Form', screen: const FormScreen()),
    ScreenRoute(route: 'listInputItems', name: 'List Input Items', screen: const ListScreenInputRecord()),
    ScreenRoute(route: 'listOutputItems', name: 'List Output Items', screen: const ListScreenOutputRecord()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRutes = {};

    appRutes.addAll({'home': (BuildContext cotext) => const HomeScreen()});

    for (final route in routes) {
      appRutes.addAll({route.route: (BuildContext context) => route.screen});
    }

    return appRutes;
  }

  // TODO: averiguar que hace realmente
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
