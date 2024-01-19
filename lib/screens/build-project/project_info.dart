import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';
import 'package:master_key_system/widgets/date_input_field.dart';
import 'package:master_key_system/widgets/drop_down.dart';
import 'package:master_key_system/widgets/number_selector.dart';
import 'package:master_key_system/widgets/primary_button.dart';
import 'package:master_key_system/widgets/text_input_field.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: GetBuilder<BuildProjectController>(
        init: BuildProjectController(),
        builder: (controller) => ListView(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE8E8E8)),
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
                    'BASIC PROJECT INFO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextInputField(
                    lable: 'Customer',
                    placeholder: 'e.g., XYZ Corporation',
                    controller: controller.customerController,
                    focusNode: controller.customerFocusNode,
                  ),
                  const SizedBox(height: 15),
                  TextInputField(
                    lable: 'Project Name',
                    placeholder: 'e.g., XYZ Corporation Project',
                    controller: controller.projectNameController,
                    focusNode: controller.projectNameFocusNode,
                  ),
                  const SizedBox(height: 15),
                  TextInputField(
                    lable: 'Project Location',
                    placeholder: 'e.g., Main Street, City',
                    controller: controller.projectLocationController,
                    focusNode: controller.projectLocationFocusNode,
                  ),
                  const SizedBox(height: 15),
                  DateInputField(
                    lable: 'Order Date',
                    placeholder: 'e.g., 01.01.2021',
                    controller: controller.projectOrderDateController,
                    focusNode: controller.projectOrderDateFocusNode,
                  ),
                  const SizedBox(height: 15),
                  TextInputField(
                      lable: 'System Number',
                      placeholder: 'e.g., RKS 000001',
                      controller: controller.projectSystemNumberController,
                      focusNode: controller.projectSystemNumberFocusNode),
                  const SizedBox(height: 15),
                  DropDown(
                    label: 'Key Type',
                    placeholder: 'PSM',
                    controller: controller.keyTypeController,
                    focusNode: controller.keyTypeFocusNode,
                    options: controller.keyTypeValues,
                  ),
                  const SizedBox(height: 15),
                  DropDown(
                    label: 'System Type',
                    placeholder: 'e.g., General Master Key',
                    controller: controller.systemTypeController,
                    focusNode: controller.systemTypeFocusNode,
                    options: controller.systemTypeValues,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NumberSelector(
                          controller: controller.nrOfLocksController,
                          lable: 'Nr. of Locks'),
                      NumberSelector(
                          controller: controller.nrOfKeysController,
                          lable: 'Nr. of Keys'),
                    ],
                  ),
                  Obx(() {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 200,
                        child: Scrollbar(
                          // thumbVisibility: true,
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller.nrOfKeys.value *
                                  controller.nrOfLocks.value,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: controller.nrOfKeys.value,
                                mainAxisExtent: 20,
                                mainAxisSpacing: 3,
                                crossAxisSpacing: 3,
                                childAspectRatio: 1.5,
                              ),
                              itemBuilder: (contect, index) {
                                return Container(
                                  // alignment: Alignment.center,
                                  width: 50,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xB20061FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: PrimaryButton(
                lable: 'CREATE PROJECT',
                onPressed: () => controller.goToReview(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
