import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => ShaderBuilder(
        (BuildContext context, FragmentShader shader, Widget? child) {
          print(2);
          return CustomPaint(painter: MandelBrotPainter(shader: shader, context: context));
        },
        assetKey: 'assets/shaders/mandelbrot.frag',
      );
}

class MandelBrotPainter extends CustomPainter {
  MandelBrotPainter({required this.context, required this.shader});
  final FragmentShader shader;
  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, MediaQuery.sizeOf(context).aspectRatio);
    shader.setFloat(1, MediaQuery.sizeOf(context).width);
    shader.setFloat(2, MediaQuery.sizeOf(context).height);
    shader.setFloat(3, 0);
    shader.setFloat(4, 0);
    shader.setFloat(5, .001);
    shader.setFloat(6, 100);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(MandelBrotPainter oldDelegate) {
    print(1);
    return true;
  }
}
