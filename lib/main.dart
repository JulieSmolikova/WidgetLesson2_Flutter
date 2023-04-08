import 'package:flutter/material.dart';
import 'package:widget_lesson2/color_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/color_selection': (context) => const ColorSelection(),
      },

      initialRoute: '/color_selection',

      home: const Scaffold(),
    );
  }
}
