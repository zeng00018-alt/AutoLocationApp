import 'package:flutter/material.dart';
import 'login_page.dart'; // Import direct puisque les deux fichiers sont dans lib/

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}