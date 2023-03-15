import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdbx/ui/demo_screens/sdbx3_screen.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => Sdbx3ScreenViewModel(),
        child: const Sdbx3Screen(),
      ),
    );
  }
}
