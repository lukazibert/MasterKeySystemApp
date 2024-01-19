import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/key_controller.dart';
import 'package:master_key_system/widgets/number_selector.dart';
import 'package:master_key_system/widgets/primary_button.dart';
import 'package:master_key_system/widgets/secondary_button.dart';
import 'package:master_key_system/widgets/text_input_field.dart';

class AddKeyScreen extends StatelessWidget {
  const AddKeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: GetBuilder<KeyController>(
          init: KeyController(),
          builder: (controller) {
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x16000000),
                        blurRadius: 11,
                        offset: Offset(0, 11),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 15,
                        offset: Offset(0, 25),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x02000000),
                        blurRadius: 18,
                        offset: Offset(0, 45),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x00000000),
                        blurRadius: 20,
                        offset: Offset(0, 70),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KEY CONFIGURATION',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextInputField(
                          lable: 'Key Name',
                          placeholder: 'e.g., Master Key',
                          controller: controller.keyNameController,
                          focusNode: controller.keyNameFocusNode),
                      const SizedBox(height: 15),
                      TextInputField(
                          lable: 'Key Tag',
                          placeholder: 'e.g., 001',
                          controller: controller.keyTagController,
                          focusNode: controller.keyTagFocusNode),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberSelector(
                              controller:
                                  controller.nrOfMechanicalKeysController,
                              lable: 'Nr. Of M-Key'),
                          NumberSelector(
                              controller:
                                  controller.nrOfElectronicKeysController,
                              lable: 'Nr. Of E-Key'),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Opens',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'All',
                                style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(10),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 3, color: Color(0xFFC7C3C3)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 2,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFCCCCCC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Column(
                        children: List.generate(
                          controller.lockList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.lockList[index]['doorNumber']
                                          as String,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      controller.lockList[index]['doorName']
                                          as String,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  padding: const EdgeInsets.all(10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 3,
                                        color: Color(0xFFC7C3C3),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: PrimaryButton(
                    lable: 'ADD NEXT KEY',
                    onPressed: () => controller.goToNextPage(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                  child: SecondaryButton(
                    lable: 'GO TO KEY LIST',
                    onPressed: () => controller.goToReview(),
                  ),
                )
              ],
            );
          }),
    );
  }
}
