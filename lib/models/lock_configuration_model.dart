class LockConfigurationModel {
  final String lockNumber;
  final String lockName;
  final String cylinderType;
  final String cylinderDimensionInner;
  final String cylinderDimensionOuter;
  final String cylinderColor;
  final int quantity;
  final String additionalInfo;
  final String image;

  LockConfigurationModel({
    required this.lockNumber,
    required this.lockName,
    required this.cylinderType,
    required this.cylinderDimensionInner,
    required this.cylinderDimensionOuter,
    required this.cylinderColor,
    required this.quantity,
    required this.additionalInfo,
    required this.image,
  });

  @override
  String toString() {
    return 'LockConfigurationModel(lockNumber: $lockNumber, lockName: $lockName, cylinderType: $cylinderType, cylinderDimensionInner: $cylinderDimensionInner, cylinderDimensionOuter: $cylinderDimensionOuter, cylinderColor: $cylinderColor, quantity: $quantity, additionalInfo: $additionalInfo, image: $image)';
  }
}
