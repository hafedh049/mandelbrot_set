import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

late final FragmentShader _shader;

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => ShaderBuilder(
        builder: (context) {
          return CustomPaint(painter: MandelBrotPainter());
        },
        assetKey: '',
      );
}

class MandelBrotPainter extends CustomPainter {
  MandelBrotPainter();

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
