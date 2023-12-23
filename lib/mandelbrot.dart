import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => ShaderBuilder(
        (BuildContext context, FragmentShader shader, Widget? child) {
          return CustomPaint(painter: MandelBrotPainter(shader: shader));
        },
        assetKey: 'assets/shaders/mandelbrot.frag',
      );
}

class MandelBrotPainter extends CustomPainter {
  MandelBrotPainter({required this.shader});
  final FragmentShader shader;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(MandelBrotPainter oldDelegate) => false;
}
