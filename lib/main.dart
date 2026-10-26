import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'DEVMOB-AutoLocation - Partie 1 Validée !',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}