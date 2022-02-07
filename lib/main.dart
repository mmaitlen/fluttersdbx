import 'package:flutter/material.dart';
import 'package:sdbx/demo_screens/sdbx1_screen.dart';

void main() {
  runApp(const SdbxApp());
}

class SdbxApp extends StatelessWidget {
  const SdbxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sdbx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sdbx1Screen(),
    );
  }
}
