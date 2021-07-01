import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'clockPainter.dart';
import 'controller.dart';

class Clock extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 64,
                            color: Color(0xFF364564).withOpacity(0.14))
                      ]),
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: Obx(() => CustomPaint(
                        painter: ClockPainter(controller.dateTime.value))),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}