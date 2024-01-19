import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:master_key_system/models/key_configuration_model.dart';
import 'package:master_key_system/models/lock_configuration_model.dart';
import 'package:master_key_system/models/project_info_model.dart';
import 'package:master_key_system/screens/build-project/add_key.dart';
import 'package:master_key_system/screens/build-project/add_lock.dart';
import 'package:master_key_system/screens/build-project/project_info.dart';
import 'package:master_key_system/screens/build-project/review_items.dart';
import 'package:master_key_system/controllers/appbar_controller.dart';
import 'package:master_key_system/screens/build-project/summary_page.dart';

class BuildProjectController extends GetxController {
  // other controllers
  late AppbarController appbarController = Get.find<AppbarController>();

  // pageview controller
  late PageController pageController;
  final RxInt currentPagei = 0.obs;
  final buildProjectPages = [const ProjectInfo(), const ReviewItems()].obs;
  final buildProjectPageAppbars = [].obs;

  // form text controllers

  // basic info
  late TextEditingController customerController;
  late TextEditingController projectNameController;
  late TextEditingController projectLocationController;
  late TextEditingController projectOrderDateController;
  late TextEditingController projectSystemNumberController;
  late TextEditingController systemTypeController;
  late TextEditingController keyTypeController;
  late TextEditingController nrOfLocksController;
  late TextEditingController nrOfKeysController;
  final RxInt nrOfLocks = 1.obs;
  final RxInt nrOfKeys = 1.obs;

  final customerFocusNode = FocusNode();
  final projectNameFocusNode = FocusNode();
  final projectLocationFocusNode = FocusNode();
  final projectOrderDateFocusNode = FocusNode();
  final projectOrderDateGlobalKey = GlobalKey();
  final projectSystemNumberFocusNode = FocusNode();
  final systemTypeFocusNode = FocusNode();
  final systemTypeKey = GlobalKey();
  final keyTypeFocusNode = FocusNode();
  final keyTypeKey = GlobalKey();
  final nrOfLocksFocusNode = FocusNode();
  final nrOfKeysFocusNode = FocusNode();

  // review
  final lockItems = <Widget>[].obs;
  final keyItems = <Widget>[].obs;

  // field data state
  final List<LockConfigurationModel> lockConfigList =
      <LockConfigurationModel>[].obs;

  final List<KeyConfigurationModel> keyConfigList =
      <KeyConfigurationModel>[].obs;

  // dropdown values
  final systemTypeValues =
      ['General Master Key', 'Master Key', 'Central Cylinder', 'Other'].obs;
  final keyTypeValues = ['PSM', 'WSM', 'NP', 'FB200', 'Other'].obs;

  // project info model
  late Rx<ProjectInfoModel> projectInfoModel;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    customerController = TextEditingController();
    projectNameController = TextEditingController();
    projectLocationController = TextEditingController();
    projectOrderDateController = TextEditingController(
        text: DateFormat('dd.MM.yyyy').format(DateTime.now()));
    projectSystemNumberController = TextEditingController();
    nrOfLocksController =
        TextEditingController(text: nrOfKeys.value.toString());
    nrOfKeysController = TextEditingController(text: nrOfKeys.value.toString());
    systemTypeController = TextEditingController();
    keyTypeController = TextEditingController();

    nrOfLocksController.addListener(() {
      nrOfLocks.value = int.tryParse(nrOfLocksController.text) ?? 1;
    });

    nrOfKeysController.addListener(() {
      nrOfKeys.value = int.tryParse(nrOfKeysController.text) ?? 1;
    });
  }

  // @override
  // void onClose() {
  //   pageController.dispose();
  //   projectNameController.dispose();
  //   projectLocationController.dispose();
  //   projectOrderDateController.dispose();
  //   projectSystemNumberController.dispose();
  //   nrOfLocksController.dispose();
  //   nrOfKeysController.dispose();
  //   systemTypeController.dispose();
  //   keyTypeController.dispose();
  //   super.onClose();
  // }

  void onPageChanged(int i) {
    currentPagei.value = i;
  }

  void goToPage(int i) {
    currentPagei.value = i;
    pageController.animateToPage(i,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void goToNextPage() {
    print(buildProjectPages);
    print('goToNextPage');
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void goToPreviousPage() {
    print('goToPreviousPage');
    int previusPage = pageController.page!.toInt() - 1;
    pageController.animateToPage(previusPage - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void goToReview() {
    buildProjectInfoModel();

    createLocksAndKeys();

    print('goToReview');
    Get.find<AppbarController>().setAppbarForReview();
    lockItems.value = buildLockItemsFromNrOfLocks(nrOfLocks.value);
    keyItems.value = buildKeyItemsFromNrOfKeys(nrOfKeys.value);
    print(lockItems.length);
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);

    print(buildProjectPages);

    refresh();
  }

  void buildProjectInfoModel() {
    projectInfoModel = ProjectInfoModel(
      customerName: customerController.text,
      projectName: projectNameController.text,
      projectLocation: projectLocationController.text,
      projectOrderDate: projectOrderDateController.text,
      systemNumber: projectSystemNumberController.text,
      systemType: systemTypeController.text,
      keyType: keyTypeController.text,
      nrOfLocks: nrOfLocks.value,
      nrOfKeys: nrOfKeys.value,
    ).obs;
  }

  void jumpToPage(int i) {
    pageController.jumpToPage(i);

    refresh();
  }

  void createLocksAndKeys() {
    print('createLocksAndKeys');
    for (var i = 0; i < nrOfLocks.value; i++) {
      // lockObject['lock${i + 1}'] = {
      //   'lockId': i + 1,
      //   'lockName': 'Lock ${i + 1}',
      //   'keyId': 'key${i + 1}',
      //   'keyName': 'Key ${i + 1}',
      // };

      buildProjectPages.add(const AddLockScreen());
    }

    buildProjectPages.add(const ReviewItems());
    // print(lockObject);
    for (var i = 0; i < nrOfKeys.value; i++) {
      // keyObject['key${i + 1}'] = {
      //   'keyId': i + 1,
      //   'keyName': 'Key ${i + 1}',
      //   'lockId': 'lock${i + 1}',
      //   'lockName': 'Lock ${i + 1}',
      // };

      buildProjectPages.add(const AddKeyScreen());
    }

    buildProjectPages.add(const ReviewItems());
    buildProjectPages.add(const SummaryPage());
    // print(keyObject);
  }

  List<Widget> buildLockItemsFromNrOfLocks(int nrOfLocks) {
    final List<Widget> lockItems = [];
    for (var i = 0; i < nrOfLocks; i++) {
      lockItems.add(
        InkWell(
          onTap: () {
            print('lock item tapped');
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            // decoration: BoxDecoration(
            //   border: Border(
            //     top: BorderSide(
            //       color: Color(0xFFE8E8E8), // Border color for other items
            //       width: 1,
            //     ),
            //   ),
            // ),
            // clipBehavior: Clip.antiAlias,
            // decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${i + 1}.',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Lock ${i + 1}',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return lockItems;
  }

  // TODO: put in to seapret widget
  List<Widget> buildKeyItemsFromNrOfKeys(int nrOfKeys) {
    final List<Widget> keyItems = [];
    for (var i = 0; i < nrOfKeys; i++) {
      keyItems.add(
        Container(
          width: double.infinity,
          // height: 26,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
          // clipBehavior: Clip.antiAlias,
          // decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      keyId(i + 1),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Key ${i + 1}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return keyItems;
  }

  String keyId(int keyNumber) {
    return keyNumber.toString().padLeft(3, '0');
  }
}
