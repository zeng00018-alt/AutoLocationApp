import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const AutoLocationApp());
}

class AutoLocationApp extends StatelessWidget {
  const AutoLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVMOB-AutoLocation',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DEVMOB-AutoLocation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Charte graphique intégrée !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Bouton Principal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}