import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/controllers/project_info_controller.dart';

class AppbarController extends GetxController {
  final RxString title = ''.obs;
  final Rx<Widget?> leadingIcon = Rx<Widget?>(null);
  final Rx<Widget?> tailIcon = Rx<Widget?>(null);

  final buildProjectAppbars = [].obs;

  @override
  void onInit() {
    setAppbarForMyProjects();
    super.onInit();
  }

  void setAppbarForMyProjects() {
    print('setAppbarForMyProjects');
    title.value = 'MY PROJECTS';
    leadingIcon.value = const SizedBox(
      width: 30,
      height: 30,
    );
    tailIcon.value = IconButton(
      icon:
          Image.asset('assets/inbox-icon_unactive.png', width: 30, height: 30),
      onPressed: () {},
    );

    update();
  }

  void setAppbarForBuildProject() {
    print('setAppbarForBuildProject');
    title.value = 'BUILD PROJECT';
    leadingIcon.value = IconButton(
      icon: Image.asset('assets/backarrow-icon.png'),
      onPressed: () {
        Get.back();
      },
    );
    tailIcon.value = const SizedBox(
      width: 30,
      height: 30,
    );

    update();
  }

  void setAppbarForReview() {
    print('setAppbarForReview');
    title.value = 'REVIEW';
    leadingIcon.value = IconButton(
      icon: Image.asset('assets/backarrow-icon.png'),
      onPressed: () {
        Get.find<BuildProjectController>().goToPreviousPage();
      },
    );
    tailIcon.value = const SizedBox(
      width: 30,
      height: 30,
    );

    update();
  }

  void setTitle(String title) {
    this.title.value = title;
  }

  void setLeadingIcon(String leadingIcon) {
    this.leadingIcon.value = stringToIconMap()[leadingIcon];
  }

  void setTailIcon(String tailIcon) {
    this.tailIcon.value = stringToIconMap()[tailIcon];
  }

  Map<String, Widget> stringToIconMap() {
    return {
      'back': Image.asset('assets/backarrow-icon.png'),
      'none': const SizedBox(
        width: 25,
        height: 25,
      ),
    };
  }
}
