import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/main_layout.dart';

void main() {
  runApp(const AutoLocationApp());
}

class AutoLocationApp extends StatelessWidget {
  const AutoLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoLocationApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}