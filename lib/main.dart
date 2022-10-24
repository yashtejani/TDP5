import 'package:flutter/material.dart';
import 'package:project/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(title: 'Bus replacing train', home: HomeScreen());
  }
}
