import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'clock.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Clock(),
                Column(
                  children: [
                    Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: FittedBox(
                          child: Text(
                            DateFormat("d - MMM - y")
                                .format(controller.dateTime.value),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: FittedBox(
                          child: Text(
                            DateFormat("h : m : s a")
                                .format(controller.dateTime.value),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
