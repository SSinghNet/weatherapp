class Location {
  final String name;
  final String? state;
  final String country;
  final double latitude;
  final double longitude;

  Location({
    required this.name,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return "@$latitude, $longitude: $name, $state, $country ";
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"] as String,
      state: json["state"] as String,
      country: json["country"] as String,
      latitude: json["lat"] as double,
      longitude: json["lon"] as double,
    );
  }
}