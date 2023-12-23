import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:mandelbrot_set/globals.dart';
import 'package:mandelbrot_set/mandelbrot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shader = await FragmentProgram.fromAsset("assets/shaders/mandelbrots.frag");
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WindowTitleBarBox(
                child: Row(
                  children: <Widget>[
                    Expanded(child: MoveWindow()),
                    MinimizeWindowButton(),
                    MaximizeWindowButton(),
                    CloseWindowButton(),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height - 31, child: const MandelBrotSet()),
            ],
          ),
        ),
      );
}
