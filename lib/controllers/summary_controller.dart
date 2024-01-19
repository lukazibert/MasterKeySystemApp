import 'package:get/get.dart';
import 'package:master_key_system/models/key_configuration_model.dart';
import 'package:master_key_system/models/lock_configuration_model.dart';
import 'package:master_key_system/models/project_info_model.dart';

class SummaryController extends GetxController {
  // Add your controller logic here

  late Rx<ProjectInfoModel> projectInformation;
  final cylinderInformation = List<LockConfigurationModel>.empty().obs;
  final keyInformation = List<KeyConfigurationModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    projectInformation.value = ProjectInfoModel(
        projectName: 'Test Project',
        customerName: 'Test Customer',
        projectLocation: 'Test Location',
        projectOrderDate: DateTime.now().toString(),
        systemNumber: 'TEST 000001',
        systemType: 'General Master Key',
        keyType: 'PMS',
        nrOfLocks: 10,
        nrOfKeys: 10);

    cylinderInformation.value = [
      LockConfigurationModel(
        lockName: 'Lock 1',
        lockNumber: '1',
        cylinderType: 'Cylinder Type 1',
        cylinderDimensionInner: 'Cylinder Dimension Inner 1',
        cylinderDimensionOuter: 'Cylinder Dimension Outer 1',
        cylinderColor: 'Cylinder Color 1',
        quantity: 1,
        additionalInfo: 'Additional Info 1',
        image: 'Image 1',
      )
    ];
  }
}


// final String lockNumber;
//   final String lockName;
//   final String cylinderType;
//   final String cylinderDimensionInner;
//   final String cylinderDimensionOuter;
//   final String cylinderColor;
//   final int quantity;
//   final String additionalInfo;
//   final String image;