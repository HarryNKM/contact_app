import 'package:contact_app/screen/home/provider/conntact_provider.dart';
import 'package:contact_app/utiles/appTheme/app_theme.dart';
import 'package:contact_app/utiles/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ContactProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: light_theme,
        darkTheme: dark_theme,
        themeMode: ThemeMode.system,
      ),
    ),
  );
}
