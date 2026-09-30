import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const PokemonAtlasApp());
}

class PokemonAtlasApp extends StatelessWidget {
  const PokemonAtlasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Atlas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          final username = args is String ? args : '';
          return HomePage(username: username);
        },
      },
    );
  }
}
