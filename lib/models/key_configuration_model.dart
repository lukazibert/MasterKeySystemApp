class KeyConfigurationModel {
  final String keyName;
  final String keyType;
  final String keyTag;
  final int nrOfMechanicalKeys;
  final int nrOfElectronicKeys;
  final List<Map<String, Object>> lockConfigurations;

  KeyConfigurationModel({
    required this.keyName,
    required this.keyType,
    required this.keyTag,
    required this.nrOfMechanicalKeys,
    required this.nrOfElectronicKeys,
    required this.lockConfigurations,
  });

  factory KeyConfigurationModel.fromJson(Map<String, dynamic> json) {
    return KeyConfigurationModel(
      keyName: json['keyName'],
      keyType: json['keyType'],
      keyTag: json['keyTag'],
      nrOfMechanicalKeys: json['nrOfMechanicalKeys'],
      nrOfElectronicKeys: json['nrOfElectronicKeys'],
      lockConfigurations: json['lockConfigurations'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'keyName': keyName,
      'keyType': keyType,
      'keyTag': keyTag,
      'nrOfMechanicalKeys': nrOfMechanicalKeys,
      'nrOfElectronicKeys': nrOfElectronicKeys,
      'lockConfigurations': lockConfigurations,
    };
  }
}
