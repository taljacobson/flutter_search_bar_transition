import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter({
    @required this.context,
    @required this.containerHeight,
    @required this.center,
    @required this.radius,
    this.color = Colors.indigo,
  })  : statusBarHeight = MediaQuery.of(context).padding.top,
        screenWidth = MediaQuery.of(context).size.width,
        isRTL = Directionality.of(context) == TextDirection.rtl;

  final Offset center;
  final double radius, containerHeight;
  final BuildContext context;

  final Color color;
  final double statusBarHeight, screenWidth;
  final bool isRTL;
  @override
  void paint(Canvas canvas, Size size) {
    final circlePainter = Paint()..color = color;

    final width = screenWidth;
    final height = containerHeight + statusBarHeight;
    final left = isRTL ? -width : 0;
    final num top = 0;

    canvas.clipRect(
      // Rect.fromLTWH(left, top, width, height)
      Rect.fromLTRB(left, top, width, height),
    );

    canvas.drawCircle(center, radius * 1.5, circlePainter);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return oldDelegate != this;
  }
}
