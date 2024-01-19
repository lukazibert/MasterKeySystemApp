import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/lock_controller.dart';
import 'package:master_key_system/widgets/drop_down.dart';
import 'package:master_key_system/widgets/image_input_field.dart';
import 'package:master_key_system/widgets/number_selector.dart';
import 'package:master_key_system/widgets/primary_button.dart';
import 'package:master_key_system/widgets/secondary_button.dart';
import 'package:master_key_system/widgets/text_input_field.dart';

class AddLockScreen extends StatelessWidget {
  const AddLockScreen({super.key});

  void initState() {
    // Initialize the LockController here
    print('AddLockScreen initState');
    Get.put(LockController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: GetBuilder<LockController>(
          init: LockController(),
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
                        'ADD LOCKS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextInputField(
                          lable: 'Lock Name',
                          placeholder: 'e.g., Meeting Room 101',
                          controller: controller.lockNameController,
                          focusNode: controller.lockNameFocusNode),
                      const SizedBox(height: 15),
                      DropDown(
                        label: 'Cylinder Type',
                        placeholder: 'e.g., single cylinder',
                        controller: controller.cylinderTypeController,
                        focusNode: controller.cylinderTypeFocusNode,
                        options: controller.cylinderTypeValues,
                      ),
                      const SizedBox(height: 15),
                      CylinderDymentionsInputField(
                        controller: controller,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropDown(
                              label: 'Color',
                              placeholder: 'e.g., black',
                              options: controller.colorValues,
                              controller: controller.lockColorController,
                              focusNode: controller.lockColorFocusNode,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: NumberSelector(
                                lable: 'Quantity',
                                controller: controller.lockQuantityController,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      AdditionalInfoInputArea(
                        controller: controller,
                      ),
                      const SizedBox(height: 15),
                      ImageInputField(controller: controller, lable: 'Image')
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: PrimaryButton(
                    lable: 'ADD NEXT LOCK',
                    onPressed: () => controller.goToNextPage(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                  child: SecondaryButton(
                    lable: 'GO TO LOCK LIST',
                    onPressed: () => controller.goToReview(),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class AdditionalInfoInputArea extends StatelessWidget {
  final LockController controller;

  const AdditionalInfoInputArea({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLines: 5,
          controller: controller.additionalInfoController,
          focusNode: controller.additionalInfoFocusNode,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          cursorColor: const Color(0xFFD6D6D6),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 13,
            ),
            hintText: 'e.g., Special Requests or Extra Notes',
            hintStyle: TextStyle(
              color: Color(0xFFD6D6D6),
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ),
      ],
    );
  }
}

class CylinderDymentionsInputField extends StatelessWidget {
  final LockController controller;

  const CylinderDymentionsInputField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cylinder Dimensions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: controller.cylinderInnerLengthController,
                focusNode: controller.cylinderInnerLengthFocusNode,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: const Color(0xFFD6D6D6),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 13,
                  ),
                  hintText: 'Inner Length',
                  hintStyle: TextStyle(
                    color: Color(0xFFD6D6D6),
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide:
                          BorderSide(color: Color(0xFFCCCCCC), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide:
                          BorderSide(color: Color(0xFFCCCCCC), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller.cylinderOuterLengthController,
                focusNode: controller.cylinderOuterLengthFocusNode,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                cursorColor: const Color(0xFFD6D6D6),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 13,
                  ),
                  hintText: 'Outer Length',
                  hintStyle: TextStyle(
                    color: Color(0xFFD6D6D6),
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide:
                          BorderSide(color: Color(0xFFCCCCCC), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide:
                          BorderSide(color: Color(0xFFCCCCCC), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
