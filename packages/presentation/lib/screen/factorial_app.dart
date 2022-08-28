import 'package:flutter/material.dart';

import 'main/main_screen.dart';

class FactorialApp extends StatelessWidget {
  const FactorialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}