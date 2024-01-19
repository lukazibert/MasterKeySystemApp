import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';
import 'package:master_key_system/models/key_configuration_model.dart';

class KeyController extends GetxController {
  late TextEditingController keyNameController;
  late TextEditingController keyTagController;
  late TextEditingController nrOfMechanicalKeysController;
  late TextEditingController nrOfElectronicKeysController;
  late List<Map<String, Object>> lockList;

  // focus nodes
  final keyNameFocusNode = FocusNode();
  final keyTagFocusNode = FocusNode();
  final nrOfMechanicalKeysFocusNode = FocusNode();
  final nrOfElectronicKeysFocusNode = FocusNode();

  final RxInt keyNumber = 1.obs;

  BuildProjectController projectController = Get.find<BuildProjectController>();

  // LockController lockController = Get.find<LockController>();

  @override
  void onInit() {
    super.onInit();
    keyNameController = TextEditingController();
    keyTagController = TextEditingController(text: keyTag(keyNumber.value));
    nrOfMechanicalKeysController = TextEditingController(text: '1');
    nrOfElectronicKeysController = TextEditingController(text: '1');
    lockList = buildlockList();
  }

  List<Map<String, Object>> buildlockList() {
    List<Map<String, Object>> doorMap = [];
    for (int i = 0; i < projectController.lockConfigList.length; i++) {
      doorMap.add({
        'doorName': projectController.lockConfigList[i].lockName,
        'doorNumber': projectController.lockConfigList[i].lockNumber,
        'isSelected': false,
      });
    }
    return doorMap;
  }

  void goToNextPage() {
    int currentIndex = projectController.pageController.page!.toInt() -
        2 -
        projectController.lockConfigList.length -
        1;

    if (currentIndex >= 0) {
      projectController.keyConfigList
          .insert(currentIndex, buildKeyConfigObject());
    }

    for (var config in projectController.lockConfigList) {
      print(config.toString());
    }

    clearControlers();

    projectController.goToNextPage();
  }

  KeyConfigurationModel buildKeyConfigObject() {
    KeyConfigurationModel keyConfig = KeyConfigurationModel(
      keyType: projectController.projectInfoModel.value.keyType,
      keyName: keyNameController.text,
      keyTag: keyTagController.text,
      nrOfMechanicalKeys: int.parse(nrOfMechanicalKeysController.text),
      nrOfElectronicKeys: int.parse(nrOfElectronicKeysController.text),
      lockConfigurations: lockList,
    );

    return keyConfig;
  }

  void clearControlers() {
    keyNameController.clear();
    keyTagController.text = keyTag(keyNumber.value);
    nrOfMechanicalKeysController.text = '1';
    nrOfElectronicKeysController.text = '1';
  }

  goToPreviousPage() {
    projectController.pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToReview() {
    projectController.pageController.jumpToPage(1);
  }

  String keyTag(int keyNumber) {
    return keyNumber.toString().padLeft(3, '0');
  }
}
