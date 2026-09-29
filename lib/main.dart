import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const AnimalAtlasApp());
}

class AnimalAtlasApp extends StatelessWidget {
  const AnimalAtlasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Atlas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      routes: {'/login': (context) => const LoginPage()},
    );
  }
}
