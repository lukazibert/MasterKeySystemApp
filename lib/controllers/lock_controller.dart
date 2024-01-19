import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';
import 'package:master_key_system/models/lock_configuration_model.dart';

class LockController extends GetxController {
  // input controllers
  late TextEditingController lockNameController;
  late TextEditingController cylinderTypeController;
  late TextEditingController cylinderInnerLengthController;
  late TextEditingController cylinderOuterLengthController;
  late TextEditingController lockColorController;
  late TextEditingController lockQuantityController;
  late TextEditingController additionalInfoController;
  Rxn<File> lockImage = Rxn<File>();

  // focus nodes
  final lockNameFocusNode = FocusNode();
  final cylinderTypeFocusNode = FocusNode();
  final cylinderInnerLengthFocusNode = FocusNode();
  final cylinderOuterLengthFocusNode = FocusNode();
  final lockColorFocusNode = FocusNode();
  final lockQuantityFocusNode = FocusNode();
  final additionalInfoFocusNode = FocusNode();

  // lock configuration list
  // final List<LockConfigurationModel> lockConfigList =
  //     <LockConfigurationModel>[].obs;

  // track of lock number
  final RxInt lockNumber = 1.obs;

  // build project controller
  final BuildProjectController projectController =
      Get.find<BuildProjectController>();

  // drop down options
  final Map<String, List<String>> cylinderTypeOptions = {
    'PSM': [
      '810 - Double cylinder',
      '8710 - Dual action cylinder',
      '815 - Knob cylinder',
      '851 1/2 - Single cylinder',
      '215 N 35mm - Padlock',
      '215N  55mm - Padlock long schackle',
      '5558/30 - Camlock',
      '30N - Round cylinder',
      '5746 - Scand. oval - inside',
      '5875 - Scand. oval - outside',
      '5558/40 - Cylinder with micro-switch',
      '5802 - Push-button cylinder',
      '710 - UK-oval Double cylinder',
      '715 - UK-oval Knob cylinder',
      '751 1/2 - UK-oval Single cylinder',
      '610 - Swiss Double cylinder',
      '615 - Swiss Knob cylinder',
      '651 1/2 - Swiss Single cylinder',
    ],
    'WSM': [
      '810 - Double cylinder',
      '8710 - Dual action cylinder',
      '815 - Knob cylinder',
      '851 1/2 - Single cylinder',
      '215 N 35mm - Padlock',
      '215N  55mm - Padlock long schackle',
      '5558/30 - Camlock',
      '30N - Round cylinder',
      '5746 - Scand. oval - inside',
      '5875 - Scand. oval - outside',
      '5558/40 - Cylinder with micro-switch',
      '5802 - Push-button cylinder',
      '710 - UK-oval Double cylinder',
      '715 - UK-oval Knob cylinder',
      '751 1/2 - UK-oval Single cylinder',
      '610 - Swiss Double cylinder',
      '615 - Swiss Knob cylinder',
      '651 1/2 - Swiss Single cylinder',
    ],
    'NP': [
      '810 - Double cylinder',
      '8710 - Dual action cylinder',
      '815 - Knob cylinder',
      '851 1/2 - Single cylinder',
      '215 N 35mm - Padlock',
      '215N  55mm - Padlock long schackle',
      '5558/30 - Camlock',
      '30N - Round cylinder',
      '5746 - Scand. oval - inside',
      '5875 - Scand. oval - outside',
      '5558/40 - Cylinder with micro-switch',
      '5802 - Push-button cylinder',
      '710 - UK-oval Double cylinder',
      '715 - UK-oval Knob cylinder',
      '751 1/2 - UK-oval Single cylinder',
      '610 - Swiss Double cylinder',
      '615 - Swiss Knob cylinder',
      '651 1/2 - Swiss Single cylinder',
    ],
    'FB200': [
      'DC - Double cylinder',
      'KC - Knob cylinder',
      'SC - Single cylinder',
      'PL - Padlock',
    ],
    'Other': [
      'Double cylinder',
      'Dual action cylinder',
      'Knob cylinder',
      'Single cylinder',
      'Padlock',
      'Padlock long schackle',
      'Camlock',
      'Round cylinder',
      'Scand. oval - inside',
      'Scand. oval - outside',
      'Cylinder with micro-switch',
      'Push-button cylinder',
      'UK-oval Double cylinder',
      'UK-oval Knob cylinder',
      'UK-oval Single cylinder',
      'Swiss Double cylinder',
      'Swiss Knob cylinder',
      'Swiss Single cylinder',
    ]
  };

  final Map<String, List<String>> colorOptions = {
    'PSM': [
      '01- Matt Nickel plated (std.)',
      '31- Matt Nickel plated - Brushed',
      '03 - Polished Brass',
      '05 - Polished Chrome',
      '23 - Brass Stainless Steel Finnish',
      '38 - Midnight Black',
    ],
    'WSM': [
      '01- Matt Nickel plated (std.)',
      '31- Matt Nickel plated - Brushed',
      '03 - Polished Brass',
      '05 - Polished Chrome',
      '23 - Brass Stainless Steel Finnish',
      '38 - Midnight Black',
    ],
    'NP': ['01- Matt Nickel plated (std.)'],
    'FB200': [
      'Nickel plated (std.)',
    ],
    'Other': [
      'Nickel',
      'Brass',
      'Custom',
    ]
  };

  late List<String> cylinderTypeValues;
  late List<String> colorValues;

  @override
  void onInit() {
    super.onInit();
    lockNameController = TextEditingController();
    cylinderTypeController = TextEditingController();
    cylinderInnerLengthController = TextEditingController();
    cylinderOuterLengthController = TextEditingController();
    lockColorController = TextEditingController();
    lockQuantityController = TextEditingController();
    additionalInfoController = TextEditingController();
    cylinderTypeValues =
        cylinderTypeOptions[projectController.projectInfoModel.value.keyType] ??
            [];
    colorValues =
        colorOptions[projectController.projectInfoModel.value.keyType] ?? [];
  }

  // image picker
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      lockImage.value = File(pickedFile.path);
    }
  }

  void goToNextPage() {
    int currentIndex = projectController.pageController.page!.toInt() - 2;

    if (currentIndex >= 0) {
      projectController.lockConfigList
          .insert(currentIndex, buildLockConfigObject());
    }

    for (var config in projectController.lockConfigList) {
      print(config.toString());
    }

    clearControlers();

    projectController.goToNextPage();
  }

  void goToReview() {
    projectController.jumpToPage(1);
  }

  LockConfigurationModel buildLockConfigObject() {
    LockConfigurationModel lockConfig = LockConfigurationModel(
      lockNumber: lockNumber.value.toString(),
      lockName: lockNameController.text,
      cylinderType: cylinderTypeController.text,
      cylinderDimensionInner: cylinderInnerLengthController.text,
      cylinderDimensionOuter: cylinderOuterLengthController.text,
      cylinderColor: lockColorController.text,
      quantity: int.tryParse(lockQuantityController.text) ?? 1,
      additionalInfo: additionalInfoController.text,
      image: lockImage.value?.path ?? '',
    );

    lockNumber.value++;

    print(lockConfig);

    return lockConfig;
  }

  void clearControlers() {
    lockNameController.clear();
    cylinderTypeController.clear();
    cylinderInnerLengthController.clear();
    cylinderOuterLengthController.clear();
    lockColorController.clear();
    lockQuantityController.clear();
    additionalInfoController.clear();
    lockImage.value = null;
  }
}
