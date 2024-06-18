// Class that represents a sensor
class Sensor {
  final String SensorId;
  final String SensorName;
  final String SensorState;
  Sensor({
    required this.SensorId,
    required this.SensorName,
    required this.SensorState,
  });

  static fromJson(Sensor sensor) {}

  factory Sensor.fromMap(Map<String, dynamic> map) {
    final SensorId = map['entity_id'];
    final SensorName = map['attributes']['friendly_name'];
    final SensorState = map['state'];
    return Sensor(
      SensorId: SensorId,
      SensorName: SensorName,
      SensorState: SensorState,
    );
  }
  
// Get the full name of the sensor
  String get fullSensorName {
    return '${Sensor(
      SensorId: SensorId, 
      SensorName: SensorName, 
      SensorState: SensorState
    ).SensorId} ${SensorName}';
  }
}
