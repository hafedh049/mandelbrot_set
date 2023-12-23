import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mandelbrot_set/globals.dart';
import 'package:mandelbrot_set/mandelbrot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shader = await FragmentProgram.fromAsset("assets/shaders/mandelbrot.frag");
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: const MandelBrotSet());
}
