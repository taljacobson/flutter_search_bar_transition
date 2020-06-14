import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(
      {this.context,
      this.containerHeight,
      this.center,
      this.radius,
      this.color = Colors.indigo}) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
  }

  final Offset center;
  final double radius, containerHeight;
  final BuildContext context;

  final Color color;
  double statusBarHeight, screenWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final circlePainter = Paint()..color = color;

    canvas.clipRect(
        Rect.fromLTWH(0, 0, screenWidth, containerHeight + statusBarHeight));
    canvas.drawCircle(center, radius, circlePainter);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return oldDelegate != this;
  }
}
