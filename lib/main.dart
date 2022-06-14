import 'package:flutter/material.dart';

import 'package:app_inventory/router/routes.dart';
import 'package:app_inventory/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Inventory',
      initialRoute: Routes.initialRoute,
      routes: Routes.getAppRoutes(),
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
