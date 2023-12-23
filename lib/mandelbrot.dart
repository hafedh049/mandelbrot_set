import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mandelbrot_set/globals.dart';

class MandelBrotSet extends StatefulWidget {
  const MandelBrotSet({super.key});

  @override
  State<MandelBrotSet> createState() => _MandelBrotSetState();
}

double _zoom = 0.1;
Offset _center = const Offset(0, 0);

class _MandelBrotSetState extends State<MandelBrotSet> {
  final GlobalKey<State> _mandelbrotKey = GlobalKey<State>();

  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) => _mandelbrotKey.currentState!.setState(() => _zoom += .01));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      key: _mandelbrotKey,
      builder: (BuildContext context, void Function(void Function()) _) => GestureDetector(
        onPanStart: (DragStartDetails details) => _center = details.globalPosition,
        child: CustomPaint(
          painter: MandelBrotPainter(key: ValueKey<double>(_zoom), shader: shader.fragmentShader(), context: context, zoom: _zoom),
        ),
      ),
    );
  }
}

class MandelBrotPainter extends CustomPainter {
  MandelBrotPainter({Key? key, required this.context, required this.shader, required this.zoom});
  final FragmentShader shader;
  final BuildContext context;
  final double zoom;
  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, MediaQuery.sizeOf(context).aspectRatio);
    shader.setFloat(1, MediaQuery.sizeOf(context).width);
    shader.setFloat(2, MediaQuery.sizeOf(context).height);
    shader.setFloat(3, _center.dx / MediaQuery.sizeOf(context).width);
    shader.setFloat(4, _center.dy / MediaQuery.sizeOf(context).height);
    shader.setFloat(5, _zoom);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(MandelBrotPainter oldDelegate) => _zoom != oldDelegate.zoom;
}
