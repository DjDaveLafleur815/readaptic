class Sensor {
  final String id;
  final String state;
  final Map<String, dynamic> attributes;
  final DateTime lastChanged;
  final DateTime lastReported;
  final DateTime lastUpdated;

  Sensor({
    required this.id,
    required this.state,
    required this.attributes,
    required this.lastChanged,
    required this.lastReported,
    required this.lastUpdated,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      id: json['entity_id'],
      state: json['state'],
      attributes: json['attributes'],
      lastChanged: DateTime.parse(json['last_changed']),
      lastReported: DateTime.parse(json['last_reported']),
      lastUpdated: DateTime.parse(json['last_updated']),
    );
  }
}