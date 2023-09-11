import 'package:flutter/material.dart';
import 'package:fluttering_pt6/pages/fakerDart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: fakerDart(),
    );
  }
}
