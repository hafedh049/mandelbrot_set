import 'dart:ui';

import 'package:flutter/material.dart';

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(painter: MandelBrotPainter());
}

class MandelBrotPainter extends CustomPainter {
  late final FragmentShader _shader;

  MandelBrotPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(rect, paint)
  }

  @override
  bool shouldRepaint(MandelBrotPainter oldDelegate) => false;
}
