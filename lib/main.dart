import 'package:flutter/material.dart';
import 'package:project/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Bus replacing train', home: Dashboard());
  }
}
