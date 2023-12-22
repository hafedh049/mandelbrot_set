import 'package:flutter/material.dart';

class MandelBrotSet extends StatelessWidget {
  const MandelBrotSet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(painter: MandelBrotPainter());
  }
}
