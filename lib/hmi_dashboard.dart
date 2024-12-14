import 'package:car_dashbord/conponets/carindicators.dart';
import 'package:car_dashbord/conponets/current_speed.dart';
import 'package:car_dashbord/conponets/gear_and_battry.dart';
import 'package:car_dashbord/conponets/speed_limit.dart';
import 'package:car_dashbord/conponets/speed_line_painter.dart';
import 'package:car_dashbord/conponets/time_and_tem.dart';
import 'package:car_dashbord/printer/hmi_shape_printer.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HmiDashboard extends StatefulWidget {
  const HmiDashboard({super.key});

  @override
  State<HmiDashboard> createState() => _HmiDashboardState();
}

class _HmiDashboardState extends State<HmiDashboard> {
  final List<double> speedLinesOpacities = [1, .80, .60, 0.4, .3, 0.2, 0.1];

  @override
  Widget build(BuildContext context) {
    // The size of HMI dashboard is fixed
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: (size.width > 1184 && size.height > 456)
            ? Container(
                margin: const EdgeInsets.all(16),
                color: Colors.black,
                constraints: const BoxConstraints(
                    maxWidth: 1488,
                    minWidth: 1184,
                    maxHeight: 604,
                    minHeight: 456),
                child: AspectRatio(
                  aspectRatio: 2.59,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CustomPaint(
                        painter: HmiShapePrinter(),
                        child: Column(
                          children: [
                            TimeAndTem(
                              constraints: constraints,
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: defaultPadding * 1.25,
                                      ),
                                      const CarIndicators(),
                                      const Spacer(),
                                      const CurrentSpeed(
                                        speed: 54,
                                      ),
                                      const Spacer(),
                                      const SpeedLimit(),
                                      const SizedBox(
                                        height: defaultPadding * 0.75,
                                      ),
                                      GearAndBattery(
                                        constraints: constraints,
                                      ),
                                    ],
                                  ),
                                  ...List.generate(
                                    speedLinesOpacities.length,
                                    (index) => Positioned(
                                      bottom: 20 + (2 * index).toDouble(),
                                      left: constraints.maxWidth * 0.13 -
                                          (30 * index),
                                      height: constraints.maxHeight * 0.8,
                                      width: constraints.maxWidth * 0.31,
                                      child: Opacity(
                                        opacity: speedLinesOpacities[index],
                                        child: CustomPaint(
                                          painter: SpeedLinerPainter(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ...List.generate(
                                    speedLinesOpacities.length,
                                        (index) => Positioned(
                                      bottom: 20 + (2 * index).toDouble(),
                                      right: constraints.maxWidth * 0.13 -
                                          (30 * index),
                                      height: constraints.maxHeight * 0.8,
                                      width: constraints.maxWidth * 0.31,
                                      child: Opacity(
                                        opacity: speedLinesOpacities[index],
                                        child: Transform.scale(
                                          scaleX: -1,
                                          child: CustomPaint(
                                            painter: SpeedLinerPainter(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            : const Center(
                child: Text("Screen is too small to show the UI"),
              ),
      ),
    );
  }
}


