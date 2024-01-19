import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/bottom_progress_bar_controller.dart';

class BottomProgressBar extends StatelessWidget {
  const BottomProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100 + MediaQuery.of(context).padding.bottom,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 25,
        bottom: 25,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 1,
            offset: Offset(0, -1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 2,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 3,
            offset: Offset(0, -5),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x02000000),
            blurRadius: 4,
            offset: Offset(0, -9),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x00000000),
            blurRadius: 4,
            offset: Offset(0, -14),
            spreadRadius: 0,
          )
        ],
      ),
      child: GetBuilder<ProjectProgressBarController>(
          init: ProjectProgressBarController(),
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 363,
                  height: 11,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) *
                              controller.progressPercentage.value /
                              100,
                          height: 11,
                          padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0061FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        left: 0,
                        top: -0,
                        child: Container(
                          height: 11,
                          padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0x470061FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(
                      flex: controller.textFlexBefore.value,
                    ),
                    const Text(
                      'Entering project information',
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(
                      flex: controller.textFlexAfter.value,
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
