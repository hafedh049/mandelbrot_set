import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

late final FragmentShader _shader;

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => ShaderBuilder(
        (BuildContext context, FragmentShader shader, Widget? child) {
          _shader = shader;
          return CustomPaint(painter: MandelBrotPainter());
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
      Paint()..shader = _shader,
    );
  }

  @override
  bool shouldRepaint(MandelBrotPainter oldDelegate) => false;
}
