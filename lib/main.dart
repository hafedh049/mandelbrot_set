import 'package:flutter/material.dart';
import 'package:mandelbrot_set/mandelbrot.dart';

Future<void> main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: const MandelBrotSet());
}
