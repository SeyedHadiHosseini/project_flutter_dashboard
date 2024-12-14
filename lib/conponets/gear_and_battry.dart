import 'dart:ui';

import 'package:car_dashbord/conponets/battery_clipper.dart';
import 'package:car_dashbord/conponets/dash_liner_printer.dart';
import 'package:car_dashbord/conponets/gear.dart';
import 'package:car_dashbord/conponets/gear_printer.dart';
import 'package:car_dashbord/constants.dart';
import 'package:flutter/material.dart';

class GearAndBattery extends StatelessWidget {
  const GearAndBattery({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.22,
      width: constraints.maxWidth * 0.74,
      child: CustomPaint(
        painter: GearPrinter(),
        child: LayoutBuilder(
          builder: (context, gearConstraints) => Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: defaultPadding / 2, bottom: defaultPadding / 4),
                    child: Gears(
                      constraints: gearConstraints,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Rest.  ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                      children: const [
                        TextSpan(
                          text: '456km',
                          style: TextStyle(
                            color: Color(0xFF77C000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: gearConstraints.maxWidth * 0.74,
                    // height: 6,
                    //color: primaryColor,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: defaultPadding / 2),
                          child: Text(
                            'E',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.16),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 6,
                            child: ClipPath(
                              clipper: BatteryClipper(),
                              child: CustomPaint(
                                painter: DashLinePrinter(progress: 1),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: defaultPadding / 2),
                          child: Text(
                            "100%",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF77C000),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
              Positioned(
                top: gearConstraints.maxHeight * 0.01,
                left: gearConstraints.maxWidth * 0.16,
                width: gearConstraints.maxWidth * 0.17,
                height: gearConstraints.maxHeight * 0.38,
                child: CustomPaint(
                  painter: AvgWattPerKmPrinter(),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: gearConstraints.maxWidth * 0.025,
                        ),
                        Text(
                          "Avg.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.16),
                          ),
                        ),
                        Text(
                          "11.3 w/km",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.32),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: gearConstraints.maxHeight * 0.01,
                right: gearConstraints.maxWidth * 0.16,
                width: gearConstraints.maxWidth * 0.17,
                height: gearConstraints.maxHeight * 0.38,
                child: CustomPaint(
                  painter: OdoPrinter(),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ODO.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.16),
                          ),
                        ),
                        Text(
                          "240km",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.32),
                          ),
                        ),
                        SizedBox(width: gearConstraints.maxWidth * 0.025,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvgWattPerKmPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;

    double strokeWidth = 4;
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.27, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.27, strokeWidth)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class OdoPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = primaryColor;

    double strokeWidth = 4;

    Path path = Path()
      ..lineTo(size.width * 0.73, 0)
      ..lineTo(size.width , size.height)
      ..lineTo(size.width * 0.72, strokeWidth)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
