import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/main_layout.dart';

void main() {
  runApp(const DEVMOBAutoLocationApp());
}

class DEVMOBAutoLocationApp extends StatelessWidget {
  const DEVMOBAutoLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVMOB-AutoLocation',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}