import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Klik Billiard',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.welcome,
      routes: AppPages.routes,
    );
  }
}
