import 'package:flutter/material.dart';

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(painter: MandelBrotPainter());
}

class MandelBrotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
