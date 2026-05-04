import 'package:ceylon_cypher_app/features/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const CeylonCypherApp());
}

class CeylonCypherApp extends StatelessWidget {
  const CeylonCypherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(), // Set login as home
    );
  }
}
