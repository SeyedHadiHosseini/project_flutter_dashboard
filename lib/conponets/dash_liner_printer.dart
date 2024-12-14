import 'dart:ui';

import 'package:car_dashbord/constants.dart';
import 'package:flutter/material.dart';

class DashLinePrinter extends CustomPainter {
  final double progress;

  DashLinePrinter({super.repaint, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint piant = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = primaryColor;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 23;
    double dashSpace = 2;
    double distance = 0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(pathMetric.extractPath(distance, distance + dashWidth),
            Offset.zero);

        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, piant);
  }

  @override
  bool shouldRepaint(DashLinePrinter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}