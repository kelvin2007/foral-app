import 'package:flutter/material.dart';
import 'package:foral/main-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instrav',
      theme: ThemeData(),
      home: FirstScreen(),
    );
  }
}