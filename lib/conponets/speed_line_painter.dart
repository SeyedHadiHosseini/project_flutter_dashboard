import 'package:car_dashbord/constants.dart';
import 'package:flutter/material.dart';

class SpeedLinerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8;
    Paint paintTop = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    // Create the top part of the speedometer line using a Path.
    Path pathTop = Path()
      ..moveTo(size.width * 0.78, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width - strokeWidth, size.height * 0.3)
      ..close();

    Paint paintBottom = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    // Create the bottom part of the speedometer line using a Path.
    Path pathBottom = Path()
      ..moveTo(size.width, size.height * 0.3)
      ..lineTo(40, size.height - 20)
      ..lineTo(size.width - strokeWidth, size.height * 0.3)
      ..close();

    // Draw the lines on the canvas.

    canvas.drawPath(pathTop, paintTop);
    canvas.drawPath(pathBottom, paintBottom);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}