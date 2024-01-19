class ProjectInfoModel {
  final String customerName;
  final String projectName;
  final String projectLocation;
  final String projectOrderDate;
  final String systemNumber;
  final String systemType;
  final String keyType;
  final int nrOfLocks;
  final int nrOfKeys;

  ProjectInfoModel({
    required this.projectName,
    required this.customerName,
    required this.projectLocation,
    required this.projectOrderDate,
    required this.systemNumber,
    required this.keyType,
    required this.systemType,
    required this.nrOfLocks,
    required this.nrOfKeys,
  });
}
