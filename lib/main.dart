import 'package:custom_bottomnavigationbar/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bottom navigation bar',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
